# Given  integers, compute their average, rounded to three decimal places.
#!/bin/bash
read input
sum=0
lop=0
while [ $input -gt $lop ]; do
read val
sum=$((sum+val))
lop=$((lop+1))
done
average=$(echo "scale=3; $sum/$input"| bc);
printf "%.3f\n" $average