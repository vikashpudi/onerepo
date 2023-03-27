#!/bin/bash
read X
read Y
if [[ $X -ge -100 && $Y -le 100 && $Y -ne 100 ]]; then

  # Compute the sum
  sum=$((X + Y))

  # Compute the difference
  diff=$((X - Y))

  # Compute the product
  prod=$((X * Y))

  # Compute the quotient
  quot=$((X / Y))

  echo "$sum"
  echo "$diff"
  echo "$prod"
  echo "$quot"
fi
