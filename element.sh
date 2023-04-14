#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1;")
  else
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE name='$1' OR symbol='$1';")
  fi
  if [[ -z $ELEMENT_NAME ]]
  then
    echo "I could not find that element in the database."
    exit
  fi
  ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$ELEMENT_NAME';")
  ELEMENT_ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$ELEMENT_NAME';")
  ELEMENT_ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ELEMENT_ATOMIC_NUMBER;")
  ELEMENT_MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEMENT_ATOMIC_NUMBER;")
  ELEMENT_BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEMENT_ATOMIC_NUMBER;")
  #ELEMENT_TYPE=$($PSQL "SELECT type FROM properties WHERE atomic_number=$ELEMENT_ATOMIC_NUMBER;")

  echo "The element with atomic number $ELEMENT_ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a nonmetal, with a mass of $ELEMENT_ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MELTING_POINT celsius and a boiling point of $ELEMENT_BOILING_POINT celsius."
fi