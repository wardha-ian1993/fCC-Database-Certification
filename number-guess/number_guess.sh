#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guessing_game -t --no-align -c"

GAMES_PLAYED=0
BEST_GAME=0

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

echo -e "\nEnter your username:"
read USERNAME

SELECT_USERNAME=$($PSQL "SELECT username FROM user_data WHERE username='$USERNAME'")
SELECT_USERNAME_FIX=$(echo $SELECT_USERNAME | sed -r 's/^ *| *$//g')

if [[ -z $SELECT_USERNAME ]]; then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
  INSERT_USERNAME=$($PSQL "INSERT INTO user_data(username) VALUES('$USERNAME')")
else
  SELECT_GAMES_PLAYED=$($PSQL "SELECT games_played FROM user_data WHERE username='$USERNAME'")
  SELECT_BEST_GAME=$($PSQL "SELECT best_game FROM user_data WHERE username='$USERNAME'")
  if [[ $SELECT_GAMES_PLAYED =~ ^[[:space:]]*$ ]]; then
    GAMES_PLAYED=0
  else
    GAMES_PLAYED=$(echo $SELECT_GAMES_PLAYED | sed -r 's/^ *| *$//g')
  fi

  if [[ $SELECT_BEST_GAME ]]; then
    BEST_GAME=$(echo $SELECT_BEST_GAME | sed -r 's/^ *| *$//g')
  else
    BEST_GAME=0
  fi

  echo -e "\nWelcome back, $SELECT_USERNAME_FIX! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
fi

echo -e "\nGuess the secret number between 1 and 1000:"
NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESS=0

NUMBER_GUESS() {
  ((NUMBER_OF_GUESS++))
  read GUESS

  if [[ $GUESS =~ ^[0-9]+$ ]]; then
    if (( $GUESS != $NUMBER )); then
      if (( $GUESS < $NUMBER )); then
        echo -e "\nIt's higher than that, guess again:"
        NUMBER_GUESS
      else
        echo -e "\nIt's lower than that, guess again:"
        NUMBER_GUESS
      fi
    else
      ((GAMES_PLAYED++))
      UPDATE_GAMES_PLAYED=$($PSQL "UPDATE user_data SET games_played=$GAMES_PLAYED WHERE username='$USERNAME'")

      if (( $BEST_GAME == 0 )); then
        UPDATE_BEST_GAME=$($PSQL "UPDATE user_data SET best_game=$NUMBER_OF_GUESS WHERE username='$USERNAME'")
      else
        if [[ $NUMBER_OF_GUESS -le $BEST_GAME ]]; then
          UPDATE_BEST_GAME=$($PSQL "UPDATE user_data SET best_game=$NUMBER_OF_GUESS WHERE username='$USERNAME'")
        else
          UPDATE_BEST_GAME=$($PSQL "UPDATE user_data SET best_game=$BEST_GAME WHERE username='$USERNAME'")
        fi
      fi

      echo -e "\nYou guessed it in $NUMBER_OF_GUESS tries. The secret number was $NUMBER. Nice job!\n"
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
    NUMBER_GUESS
  fi
}

NUMBER_GUESS
