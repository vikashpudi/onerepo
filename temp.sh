#!/bin/bash
scn(){
    read val1
    read val2
}
add() {
    sum=$(($1+$2))
    #echo the adddtion of two  nu,bers is $sum
    #return $sum
    dummy=murali
    return $dummy
}
sub() {
    diff=$(($1-$2))
    echo "the diffrence of two numbers is $diff"
}
echo " 1. for addtion "
echo " 2. for diffrence "
read option
if [ $option -eq 1 ] ; then
 scn
add $val1 $val2
#echo $sum
echo $dummy
elif [ $option -eq 2 ]; then 
 scn
sub $val1 $val2
fi
