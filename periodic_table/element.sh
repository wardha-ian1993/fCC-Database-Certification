#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

ATOMIC_NUMBER=""
SYMBOL=""
NAME=""

QUERIES=""

PERIODIC_TABLE() {
  if [[ -z $ATOMIC_NUMBER && -z $SYMBOL && -z $NAME ]]; then
    echo 'I could not find that element in the database.'
    else
      if [[ $ATOMIC_NUMBER ]]; then
        QUERIES=$($PSQL "SELECT * FROM elements FULL JOIN properties using(atomic_number) FULL JOIN types using(type_id) WHERE atomic_number = $ATOMIC_NUMBER")
        echo $QUERIES | while IFS="|" read TYPE_ID NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
        do
          echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
        done
      fi
      if [[ $SYMBOL ]]; then
        QUERIES=$($PSQL "SELECT * FROM elements FULL JOIN properties using(atomic_number) FULL JOIN types using(type_id) WHERE symbol = '$SYMBOL'")
        echo $QUERIES | while IFS="|" read TYPE_ID NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
        do
          echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
        done
      fi
      if [[ $NAME ]]; then
        QUERIES=$($PSQL "SELECT * FROM elements FULL JOIN properties using(atomic_number) FULL JOIN types using(type_id) WHERE name = '$NAME'")
        echo $QUERIES | while IFS="|" read TYPE_ID NUMBER SYMBOL NAME MASS MELTING BOILING TYPE
        do
          echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
        done
      fi 
  fi
}

if [[ $1 ]]; then
  if [[ $1 =~ ^[0-9]+$ ]]; then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1")
    else
      SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol = '$1'")
      NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1'")
  fi
  PERIODIC_TABLE
  else
    echo 'Please provide an element as an argument.'
fi
