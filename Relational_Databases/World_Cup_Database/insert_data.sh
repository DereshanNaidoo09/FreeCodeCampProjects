#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clears any previous data from tables
echo $($PSQL "TRUNCATE games,teams")

# Read CSV file
cat games.csv | while IFS="," read YEAR ROUND WIN OPP WIN_G OPP_G
do
  if [[ $YEAR != 'year' ]]
  then
    #get year
    YEAR_RESULT=$YEAR

    #get round
    ROUND_RESULT=$ROUND

    #get winner
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WIN';")
    #if no team_id
    if [[ -z $TEAM_ID ]]
    then
      #add team to teams table
      ($PSQL "INSERT INTO teams(name) VALUES('$WIN')")
    fi  
    WIN_RESULT=$($PSQL "SELECT team_id FROM teams WHERE name = '$WIN'")

    #get opponent
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP';")
    #if no team_id
    if [[ -z $TEAM_ID ]]
    then
      #add team to teams table
      ($PSQL "INSERT INTO teams(name) VALUES('$OPP')")
    fi  
    OPP_RESULT=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")

    #get winner_goals
    WIN_G_RESULT=$WIN_G

    #get opponent_goals
    OPP_G_RESULT=$OPP_G

    #add row to games table
    ($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR_RESULT, '$ROUND', $WIN_RESULT, $OPP_RESULT, $WIN_G_RESULT, $OPP_G_RESULT)")
  fi
done