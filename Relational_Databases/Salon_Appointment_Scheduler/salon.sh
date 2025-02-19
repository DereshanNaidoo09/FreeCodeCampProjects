#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ THE SALON ~~~~~\n"

echo -e "Welcome to The Salon, how can I help you?\n"

#print services
MAIN_MENU() {
   if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  
  SERVICES=$($PSQL "SELECT * FROM services")

  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do 
   echo -e "$SERVICE_ID) $SERVICE_NAME"
  done  
 
  SERVICE_HANDLER
}

#handles the service details
SERVICE_HANDLER() {
  read SERVICE_ID_SELECTED
  SERVICE_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_SELECTED ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else
    CUSTOMER_HANDLER $SERVICE_SELECTED
 
  fi
}

 #handles the customer details
CUSTOMER_HANDLER() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_PHONE_RESULT=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_PHONE_RESULT ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME 
    ADD_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

  SERVICE_ID=$1
  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  
  APPOINTMENT_HANDLER $SERVICE_ID $SERVICE $CUSTOMER_NAME $CUSTOMER_ID
}

#handles the appointment details
APPOINTMENT_HANDLER() {
  echo -e "\nWhat time would you like your $2, $3?"
  read SERVICE_TIME
  
  ADD_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($4, $1, '$SERVICE_TIME')")
  echo -e "\nI have put you down for a $2 at $SERVICE_TIME, $3."
}

MAIN_MENU



