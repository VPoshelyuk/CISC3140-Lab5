#!/bin/bash

read -p "Enter your command(-h or help for help): " query #read user input
stringarray=($query)    #transform input to array
if [ "$query" == "-h" ] || [ "$query" == "help" ]   #print help
then
    echo "$(<assets/help.txt)"
    exit 1
elif [ "${#stringarray[@]}" -lt "3" ]   #error handling
then
    echo "Please provide 3 arguments: --command option value"
    echo "Ex.: --count borough brooklyn"
    exit 1
fi

#awk program to work with CSV
gawk -v com=${stringarray[0]} -v option=${stringarray[1]} -v val=${stringarray[2]} '
BEGIN {
    FPAT = "([^,]+)|(\"[^\"]+\")"
}
NR==1 {
    for (i=1;i<=NF;++i) if (tolower($i)~tolower(option)) { n=i;break } 
} { 
    if(tolower($n)~tolower(val)) {
        if (com == "--count"){
            count++
        } else if (com == "--print-full-records") {
            { printf "%s\n\n\n",$0 }
        }
    }
}
END {
    if (com == "--count"){print count}
    else if (com != "--count" && com != "--print-full-records"){print "Illegal command!"}
}' assets/filmPermits.csv
