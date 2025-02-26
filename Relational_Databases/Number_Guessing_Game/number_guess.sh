#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

#Script for number guessing game

#create field variables
#number of guesses
NUMBER_OF_GUESSES=0
#current guess
GUESS=0
#generate random number, between 1-1000
RANDOM_NUMBER=$((1 + $RANDOM % 1000))

#get username
echo "Enter your username:"
read USERNAME

USERNAME_CHECK=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")
#if returning user
if [[ ! -z $USERNAME_CHECK ]]
then
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
#else new user
else
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi
echo $RANDOM_NUMBER
echo "Guess the secret number between 1 and 1000:"
#while user has not guessed number
while [[ $GUESS -ne $RANDOM_NUMBER ]]
do
  #accept guess
  read GUESS
  #if not an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  #else
  else
    #if higher than number
    if [[ $GUESS -gt $RANDOM_NUMBER ]]
    then
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      echo "It's lower than that, guess again:"
    #if lower than number
    elif [[ $GUESS -lt $RANDOM_NUMBER ]]
    then
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      echo "It's higher than that, guess again:"
    #else
    else
      NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
      GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played=$(( $GAMES_PLAYED + 1 )) WHERE username = '$USERNAME'")
      UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME' AND (best_game > $NUMBER_OF_GUESSES OR best_game IS NULL)")
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    fi  
  fi    
done

    