# CISC3140 Lab5: Shell script for CSV parsing

---
### About
---
This program utilizes standard commands such as read and echo to prompt user for input and print out some basic information.   
Also gawk(GNU awk) is used in this script to search certains fields of the NYC film permits CSV for the values user provided in their search query. `-h` or `help` command can be used to get more information on how to form your query.    
gawk script itself is very simple, user input is provided as arguments there.   
In the BEGIN rule there is a pattern provided to parse CSV correctly. Initially I wanted to utilize regular awk, but unfortunately it does not suport more complex formatters like FPAT.   
Next rule is NR==1, here awk script compares user inputted option with CSV file headers, if there is a match, depending on user inputted command they will be presented eiter with full records matching the search query or just the number of them.   
END rule includes some error handling and print statement in case user is looking for matching records count.

---
### Dependencies
---
- Terminal for command line access
- Bash version 3.2.57 (use `bash --version` to see what version is installed on your machine, if any)
- GAwk version 5.1.0 (use `gawk --version` to see what version is installed on your machine, if any)

---
### Setup and Usage
---
1. While you are in the home directory of this repo, press on the green "Code" button in the top right corner.
2. You will be prompted to copy an SSH or HTTPS URL to clone this repo to your local machine(I personally prefer to clone over SSH, because it's more secure).
3. After you got that URL, go to the terminal on your local machine and run the following command: 
```zsh
git clone *PASTE THE LINK HERE*
```
4. It should not tale long to copy all the files to your computer, since this is a very lightweight repo, so after it's done cd to the newly created folder by running: 
```zsh 
cd CISC3140-Lab5
```  
5. When you are inside of the CISC3140-Lab5 directory, run the following command: 
```zsh
sh queryFilms.sh
```
I strongly advise starting with `-h` or `help` command to see what types of queries are supported.