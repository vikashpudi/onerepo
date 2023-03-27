#!bin/bash


drawLine() {
    # $1 => No of lines needed to print
    
    for rows in $( seq 1 $1 ); do
        for underscore in $( seq 1 100 ); do
            printf "_"
        done
        printf "\n"
    done
}

printer() {

    upperRows=$1
    upStartIndex=$2
    upEndIndex=$3
    downIndex=$4

    chrLimitUpper=$5
    chrLimitLower=$6

    upperEnd=$7
    lowerEnd=$8

    upperSkipper=$9
    lowerSkipper=${10}

    totalRows=$(( $upperRows * 2 ))


    # for row in $(seq 1 $totalRows); do
    for(( row=1; row<=$totalRows; row++ )); do
        # Print upper rows of Y
        if(( $row <= $upperRows )); then
            for(( chr=1; $chr<=$chrLimitUpper;chr++ )); do

                if(( $chr == $upStartIndex || $chr == $upEndIndex )); then
                    printf "1"
                fi

                if(( $upperEnd == -1 )); then
                    printf "_"
                    continue
                fi

                positions=()
                previousEvenIndex=0
                previousOddIndex=0

                # Increment the Upper Starting indexes and save the values in an array
                for(( i=0; i<=$upperEnd; i++ )); do

                    if(( $(( $i % 2 )) == 0 )); then
                        # Even
                        if(( $i == 0 )); then
                            positions[$i]=$(($upStartIndex + $upperSkipper))
                        else
                            positions[$i]=$(($previousEvenIndex + $upperSkipper))
                        fi
                        previousEvenIndex="${positions[$i]}"

                    else
                        # Odd
                        if(( $i == 1 )); then
                            positions[$i]=$(($upEndIndex + $upperSkipper))
                        else
                            positions[$i]=$(($previousOddIndex + $upperSkipper))
                        fi
                        previousOddIndex="${positions[$i]}"
                    fi

                done

                for pos in "${positions[@]}"; do
                    if(( $chr == $pos )); then
                        printf "1"
                    fi
                done

                printf "_"

            done
            printf "\n"
            upStartIndex=$(( $upStartIndex + 1 ))
            upEndIndex=$(( $upEndIndex - 1 ))


        # Print lower rows of Y
        else
            for(( chr2=1; $chr2<=$chrLimitLower;chr2++ )); do
                if(( $chr2 == $downIndex )); then
                    printf "1"
                fi

                if(( $lowerEnd == -1 )); then
                    printf "_"
                    continue
                fi

                positions=()
                previousIndex=0

                # Increment the Lower Starting indexes and save the values in an array
                for(( i=0; i<=$lowerEnd; i++ )); do

                    if(( $i == 0 )); then
                        positions[$i]=$(( $downIndex + $lowerSkipper ))
                        previousIndex="${positions[$i]}"
                        continue                        
                    fi

                    positions[$i]=$(($previousIndex + $lowerSkipper))
                    previousIndex="${positions[$i]}"

                done

                
                for pos in "${positions[@]}"; do
                    if(( $chr2 == $pos )); then
                        printf "1"
                    fi
                done
                
                printf "_"
            done
            printf "\n"

        fi

    done

}

draw1Y() {

    # Generate tree properties
    upperRows=$1
    upStartIndex=34
    upEndIndex=$(( $upStartIndex + 31 ))
    downIndex=50
    chrLimitUpper=98
    chrLimitLower=99
    upperEnd=-1
    lowerEnd=-1
    upperSkipper=0
    lowerSkipper=0

    printer $upperRows $upStartIndex $upEndIndex $downIndex $chrLimitUpper $chrLimitLower $upperEnd $lowerEnd $upperSkipper $lowerSkipper

}

draw2Y() {

    # Generate tree properties
    upperRows=$1
    upStartIndex=26
    upEndIndex=$(( $upStartIndex + 15 ))
    downIndex=34
    chrLimitUpper=96
    chrLimitLower=98
    upperEnd=1
    lowerEnd=0
    upperSkipper=30
    lowerSkipper=31

    printer $upperRows $upStartIndex $upEndIndex $downIndex $chrLimitUpper $chrLimitLower $upperEnd $lowerEnd $upperSkipper $lowerSkipper

}

draw3Y() {

    # Generate tree properties
    upperRows=$1
    upStartIndex=22
    upEndIndex=$(( $upStartIndex + 7 ))
    downIndex=26
    chrLimitUpper=92
    chrLimitLower=96
    upperEnd=5
    lowerEnd=2
    upperSkipper=14
    lowerSkipper=15

    printer $upperRows $upStartIndex $upEndIndex $downIndex $chrLimitUpper $chrLimitLower $upperEnd $lowerEnd $upperSkipper $lowerSkipper

}

draw4Y() {

    # Generate tree properties
    upperRows=$1
    upStartIndex=20
    upEndIndex=$(( $upStartIndex + 3 ))
    downIndex=22
    chrLimitUpper=84
    chrLimitLower=92
    upperEnd=13
    lowerEnd=6
    upperSkipper=6
    lowerSkipper=7

    printer $upperRows $upStartIndex $upEndIndex $downIndex $chrLimitUpper $chrLimitLower $upperEnd $lowerEnd $upperSkipper $lowerSkipper

}

draw5Y() {

    # Generate tree properties
    upperRows=$1
    upStartIndex=19
    upEndIndex=$(( $upStartIndex + 1 ))
    downIndex=20
    chrLimitUpper=68
    chrLimitLower=84
    upperEnd=29
    lowerEnd=14
    upperSkipper=2
    lowerSkipper=3

    printer $upperRows $upStartIndex $upEndIndex $downIndex $chrLimitUpper $chrLimitLower $upperEnd $lowerEnd $upperSkipper $lowerSkipper

}


# printf "Enter option (1,2,3): "
read option

if (( $option == 1 )); then
    drawLine 31
    draw1Y 16

elif (( $option == 2 )); then
    drawLine 15
    draw2Y 8
    draw1Y 16

elif (( $option == 3 )); then
    drawLine 7
    draw3Y 4
    draw2Y 8
    draw1Y 16

elif (( $option == 4 )); then
    drawLine 3
    draw4Y 2
    draw3Y 4
    draw2Y 8
    
    draw1Y 16

elif (( $option == 5 )); then
    drawLine 1
    draw5Y 1
    draw4Y 2
    draw3Y 4
    draw2Y 8
    draw1Y 16

else
    echo "Max Option 5 allowed."
fi
