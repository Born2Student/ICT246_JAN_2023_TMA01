#!/bin/bash

###### Question 3a ######

echo "### Question 3a Condition 1"


# This gets the name of the bash script
echo "Name of the Script: $0"

# This gets the total number of arguments passed to the script
echo "Total of Arguments: $#"


# This script finds whether the number of arguments passed in the executed command is more or less than 2 and it will provide a error message
if [[ $# -ne 2 ]]; then
	echo "The command executed provides an invalid number of arguments."
	exit 1
else
	echo "The $1 argument has been found and $2 argument has been found."
	
fi

echo ""



echo "### Question 3a Condition 2"

# I created a variable called FILENAME that is assigned a string "passwd"
FILENAME="passwd"


# Loop through a variable called UNAME
for UNAME; do
	# This will iterate through each line of the passwd file
	while IFS=: read username password userid groupid fullname home_dir cmdshell; do
                # I used this condition to display the information below
                if test "$1" = "$UNAME"; then
                       echo "-------------------------------------------"
                       echo "Username:       $username"	# Display username
                       echo "Password:       $password"	# Display password
                       echo "User ID (UID):  $userid"	# Display user id
                       echo "Group ID (GID): $groupid"	# Display group id
                       echo "User info:      $fullname"	# Display full name
                       echo "Home directory: $home_dir"	# Display home directory
                       echo "Command shell:  $cmdshell"	# Display shell
                       
                       echo "-------------------------------------------"
                       
                       
                       # This conditions checks if the passwd file exists
                       if [[ -f "$FILENAME" ]]; then
    				echo "The $FILENAME file does exists"
    				echo "-------------------------------------------"
    			else
    				echo "The passwd file apparently does not exists"
    				exit 1
	    			echo "-------------------------------------------"
			fi
			
			
			# This condition checks if the passwd file exists and can be read
			if [[ -r "$FILENAME" ]]; then
				echo "The $FILENAME file does exists and is readable"
				echo "-------------------------------------------"
			else
    				echo "The passwd file apparently does not exists and is therefore not readable"
    				exit 1
	    			echo "-------------------------------------------"
			fi
			
			
			# This condition gets the users with User ID that is greater or equal to 1000 from the passwd file
			for userid in `awk -F: '{print $3}' passwd`
			do

				if (("$userid" >= 1000)); then
					echo "Valid User" :`cat passwd | grep ":$userid:" | awk -F: '{print $1,$3}'`
					echo "-------------------------------------------"
				fi
			done	
			
			
			# This condition searches for several users that exists in the passwd file
			if egrep -w '^(root|daemon|bin|sys|sync)' passwd; then
				echo "The root, daemon, bin, sys and sync users exists in the passwd file"
				echo "-------------------------------------------"
			else
				echo "The root, daemon, bin, sys and sync users do not exists in the passwd file"
				exit 1
				echo "-------------------------------------------"
				
			fi
				
			
			# This condition checks if the passwd file contains valid entries and only the syntatic correctness
			if ! out=$(pwck -r passwd 2>&1); then
			   if <<<"$out" grep -q 'invalid user name\|invalid user ID\|invalid password file entry'; then
			       echo "File is syntactically wrong"
			       exit 1
			       echo "-------------------------------------------"
			   else
				echo "Something else is wrong with the file"
				echo "-------------------------------------------"
			   fi
			fi
			
			
			# This condition checks if the username in each line in the passwd file has no more than 32 characters
			if [[ $username =~ ^[a-z]{1,32}+$ ]];then
				echo "The passwd file usernames have the valid number of characters which is a maximum of 32 characters"
				echo "-------------------------------------------"
			else
				echo "The passwd file usernames have a invalid number of characters which is more than 32 characters"
				exit 1
				echo "-------------------------------------------"
			fi
			
			
			# This condition checks if the password value in each line in the paswd file has a valid value.
			if [[ $password == "x" ]] || [[ $password == "" ]]; then
			 	echo "The passwd file passwords are valid because they either are left blank or they have a x as the value."
			 	echo "-------------------------------------------"
			else
			 	echo "The passwd file passwords are invalid because they have invalid characters"
			 	exit 1
			 	echo "-------------------------------------------"
			fi 
			
			
			# This condition checks if the User ID in each line in the passwd file has valid characters
			if [[ $userid =~ ^[0-9]+$ ]]; then
				echo "The passwd file userid's are valid as they only contain numbers"
				echo "-------------------------------------------"
			else
				echo "The passwd file userid's are invalid because they have invalid characters"
				exit 1
				echo "-------------------------------------------"
			fi
			
			
			# This condition checks if the Group ID in each line in the passwd file has valid characters
			if [[ $groupid =~ ^[0-9]+$ ]]; then
				echo "The passwd file groupid's are valid as they only contain numbers"
				echo "-------------------------------------------"
			else
				echo "The passwd file groupid's are invalid because they have invalid characters"
				exit 1
				echo "-------------------------------------------"
			fi
			
			
			# This condition checks that all 7 fields are found in each line in the passwd file
			if [ "$username" ] || [ "$password" ] || [ "$userid" ] || [ "$groupid" ] || [ "$fullname" ] || [ "$home_dir" ] || [ "$cmd_shell" ]; then
				echo "All Fields Are Found In The passwd file"
				echo "-------------------------------------------"
			else
				echo "We have A Invalid Number Of Fields In The passwd file"
				exit 1
				echo "-------------------------------------------"
			fi
			
			
			# This command checks that a valid home directory can be found in each line of the passwd file
			if [[ -d "$home_dir" ]]; then
				echo "The passwd file has a valid existing home directory"
				echo "-------------------------------------------"
			else
				echo "The passwd file directory is invalid because it does not exists"
				exit 1
				echo "-------------------------------------------"
			fi
			
                       # When the current iterated item is equal to 2 exit the loop and move on to the next line                     
                       continue 2
               fi
               
	done < $FILENAME
	
	echo "No other entry for user $UNAME" >&2
	echo "-------------------------------------------"
	echo "The password file format is valid."
	echo "-------------------------------------------"
done



echo ""
	
echo "### Question 3a Condition 3"

# Use a variable called FILENAME_2 and assign to a string "group"
FILENAME_2="group"

# Loop through a variable called UNAME
for UNAME; do
	
	# This will iterate through each line of the group file
	while IFS=: read -r group_name group_password group_id group_users; do
		
		# I used this condition to display the information below
		if test "$1" = "$UNAME"; then
			echo "-------------------------------------------"
                       echo "Group Name: $group_name"		# Display Group Name
                       echo "Group Passwd: $group_password"		# Display Group Password
                       echo "Group ID: $group_id"			# Display Group ID
                       echo "Group Users: $group_list"		# Display Group List
                       
                       echo "-------------------------------------------"
                       
                       
                       # This condition checks that each line has 4 fields in the group file
                       if [ "$group_name" ] || [ "$group_password" ] || [ "$group_id" ] || [ "$group_list" ]; then
                       	echo "All Fields Are Found In The group file"
				echo "-------------------------------------------"
			else
				echo "We have A Invalid Number Of Fields In The group file"
				echo "-------------------------------------------"
				exit 1
                       fi
                       
			
			# This condition checks that users have a Group ID >= 0 in the group file
			for group_id in `awk -F: '{print $3}' $FILENAME_2`
			do

				if (("$group_id" >= 1000)); then
					echo "Valid Group ID" :`cat $FILENAME_2 | grep ":$group_id:" | awk -F: '{print $1,$3}'`
					echo "-------------------------------------------"
				fi
			done	
			 
			 
			 # This condition checks that the Group ID in each line in the group file has valid characters
			 if [[ $group_id =~ ^[0-9]+$ ]]; then
			 	echo "The group file groupid's are valid as they only contain numbers"
				echo "-------------------------------------------"
			 else
			 	echo "The group file groupid's are invalid because they have invalid characters"
			 	exit 1
			 	echo "-------------------------------------------"
			 	
			 fi
			 
			
			# This condition checks that the Group Name in each line in the group file has valid characters
			if [[ $group_name =~ ^[a-zA-Z0-9_]*$ ]]; then
				echo "The group names in the group file are valid because they have valid alphanumeric and underscore characters"
				echo "-------------------------------------------"
			 	
			else
			 	echo "The group names in the group file are invalid because they have invalid characters"
			 	exit 1
			 	echo "-------------------------------------------"
			fi
			 
			 
			# This condition checks that the group passwords in each line in the group file has valid characters
			if [[ $group_password == "x" ]] || [[ $group_password == "" ]]; then
			 	echo "The group file group passwords are valid because they either are left blank or they have a x as the value."
			 	echo "-------------------------------------------"
			else
			 	echo "The group file group passwords are invalid because they have invalid values"
			 	exit 1
			 	echo "-------------------------------------------"
			fi 
			
			
			# This condition that the group list in each line in the group file has valid characters
			if [[ $group_list == "" ]] || [[ $group_list =~ ^[a-zA-Z0-9_,]*$ ]]; then
				echo "The group file contains valid group users that denoted by blanks or alphanumerics, underscores and commas"
				echo "-------------------------------------------"
			else
				echo "The group file contains invalid group users because they contain invalid characters"
				exit 1
				echo "-------------------------------------------"
			fi

			 
			 # When the current iterated item is equal to 2 exit the loop and move on to the next line                     
			continue 2
		
		fi
	
	done < $FILENAME_2
	echo "No other entry for user $UNAME" >&2
	echo "-------------------------------------------"
	echo "group file format is valid"
	echo "-------------------------------------------"
done



echo ""

echo "### Question 3a Condition 4"

# Create an empty file called userpassword
touch userpassword

grep "/bin/bash" passwd > userpassword

grep "/bin/sh" passwd >> userpassword


echo ""

echo "### Question 3b Condition 1"

# Display the content of userpassword file
cat userpassword


echo ""

echo "### Question 3b Condition 2"

# Create an empty file called combinepwgp
touch combinepwgp

# This command copies the 1st and 46th lines in the passwd file to the combinepwgp file
# This is done by using the sed command get specific lines from the passwd file
sed -n '1p;46p' passwd > combinepwgp

# Use the sed command to find the semi colons and replace them with dashes in the combinepwgp file
sed -i 's/:/-/g' combinepwgp


echo ""

echo "### Question 3b Condition 3"

# Display the content of userpassword file
cat combinepwgp

echo "-------------------------------------------"

echo "combinepwgp File Permissions And Username of the Owner:" 
# Use the stat command to display the Permissions and Username of the Owner of the combinepwgp file
stat -c '%A %a %U' combinepwgp

echo "-------------------------------------------"


echo ""

echo "### Question 3b Condition 4"

# Insert a empty line to the combinepwgp file
echo "" >> combinepwgp

# Use the sed command to insert the current date and time in this format into the combinepwgp file
sed -i "3s|^|$(date +"%d-%m-%Y:%H:%M") |" combinepwgp

echo "-------------------------------------------"



echo ""

echo "### Question 3c Condition 1 Part 1"

# I used this script to get the users that have the User ID's that are between 0 and 1010 and count how many are there
count=0;

OIFS=$IFS;
IFS=:


while read line; do
	res=`echo $line | awk '{print $3}'`;
	
	if [ $res -ge 0 ] && [ $res -lt 1010 ]; then
		count=`expr $count + 1 `
	fi
done < passwd

echo "Total Number of User Accounts:"

echo $count

IFS=$OIFS

echo "-------------------------------------------"



echo ""

echo "### Question 3c Condition 1 Part 2"

echo "Largest User ID From All The User Accounts In The passwd File:"

# I used this script to get the user with the User ID that is greater than or equal to 1200 
awk -F ':' '$3>=1200 {print "Username: "$1", User ID: "$3}' passwd

echo "-------------------------------------------"



echo ""

echo "### Question 3c Condition 2 Part 1"

# Use change owner command to change both the Owner and Group to ubuntu for the userpassword file
chown ubuntu:ubuntu userpassword

ls -l userpassword

echo "-------------------------------------------"


echo ""

echo "### Question 3c Condition 2 Part 2"

# Command to change the permissions of the userpassword file to read, write and execute for the owner and read for the group and others
chmod 744 userpassword

# Display the permissions in the long format for the userpassword file
ls -l userpassword

echo "-------------------------------------------"



echo ""

echo "### Question 3c Condition 3"

echo "Owner, Group and Permissions of File combinepwgp:"
# Insert the owner username:owner group name:permissions of the combinepwgp file in this format into the combinepwgp file
stat -c '%U:%G:%A' combinepwgp >> combinepwgp

exit 1


