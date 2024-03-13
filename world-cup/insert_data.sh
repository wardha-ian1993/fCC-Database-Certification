#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read WINNER OPPONENT
do
  if [[ $YEAR != year ]]
    then
    INSERT_TEAM_RES=$($PSQL "insert into teams(name) values('$WINNER'), ('$OPPONENT') on conflict name do nothing")
  fi
done

cat games.csv | while IFS="," read YEAR ROUNDS WINNER OPPONENT WIN_GOALS OPP_GOALS
do
  if [[ $YEAR != year ]]
    then
    #get winner and opponent id
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    OPPONT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    #insert game data
    INSERT_GAME_RES=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUNDS', $WINNER_ID, $OPPONT_ID, $WIN_GOALS, $OPP_GOALS)")
  fi
done
