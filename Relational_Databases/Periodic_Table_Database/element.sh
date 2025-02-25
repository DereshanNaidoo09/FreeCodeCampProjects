#!/bin/bash

#Script for interacting with the periodic table database

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#Argument
if [[ $1 ]]
then
  #check atomic_number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    isAtomicNumber=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1")
  fi
  #check symbol
  isSymbol=$($PSQL "SELECT * FROM elements WHERE symbol = '$1'")
  #check name
  isName=$($PSQL "SELECT * FROM elements WHERE name = '$1'")
  #if argument in elements
  if [[ ! -z $isAtomicNumber ]]
  then
    #atomic_number
    ATOMIC_NUMBER=$1
    #symbol
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
    #name
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
    #type
    TYPE=$($PSQL "SELECT type FROM properties FULL JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER;")
    #atomic_mass
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties FULL JOIN elements USING(atomic_number) WHERE atomic_number = $ATOMIC_NUMBER")
    #melting_point
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties FULL JOIN elements USING(atomic_number) WHERE atomic_number = $ATOMIC_NUMBER")
    #boiling_point
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) WHERE atomic_number = $ATOMIC_NUMBER")
    #print message
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  elif [[ ! -z $isSymbol ]] 
  then 
    #symbol
    SYMBOL=$1
    #atomic_number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$SYMBOL'")
    #name
    NAME=$($PSQL "SELECT name FROM elements WHERE symbol = '$SYMBOL'")
     #type
    TYPE=$($PSQL "SELECT type FROM properties FULL JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
    #atomic_mass
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties FULL JOIN elements USING(atomic_number) WHERE atomic_number = $ATOMIC_NUMBER")
    #melting_point
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties FULL JOIN elements USING(atomic_number) WHERE atomic_number = $ATOMIC_NUMBER")
    #boiling_point
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) WHERE atomic_number = $ATOMIC_NUMBER")
    #print message
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  elif [[ ! -z $isName ]]
  then
    #name 
    NAME=$1
    #atomic_number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$NAME'")
    #symbol
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name = '$NAME'")
     #type
    TYPE=$($PSQL "SELECT type FROM properties FULL JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER;")
    #atomic_mass
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties FULL JOIN elements USING(atomic_number) WHERE atomic_number = $ATOMIC_NUMBER")
    #melting_point
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties FULL JOIN elements USING(atomic_number) WHERE atomic_number = $ATOMIC_NUMBER")
    #boiling_point
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties FULL JOIN elements USING(atomic_number) WHERE atomic_number = $ATOMIC_NUMBER")
    #print message
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  #If not in elements
  else
    #print message 
    echo "I could not find that element in the database."
  fi
#No argument
else
  #print message
  echo "Please provide an element as an argument."
fi  