#!/bin/bash
read opt
i=0
while [ $i -le $opt  ]
do
val=$(./ds.bash $i )
echo 5 \* $i = $val
i=$((i+1))
done