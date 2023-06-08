**# ICT246_JULY_2022_TMA01**

**ICT246 July Semester 2022 Tutor-Marked Assignment (TMA01)**

**Topics:**

- Overview of operating systems
- Memory management
- Process management
- File system management
- Device management
- Fault Tolerance
- System management
- System security
- Access Control
- Virtualization
- Linux operating system
- Mobile operating systems

**Learning Outcomes**

- Explain the core functions of an operating system
- Contrast the layers of an operating system
- Describe how the processes, threads and memory are managed
- Compare the different types of mobile operating systems
- Demonstrate the creation and usage of virtual machine
- Execute system tasks in Linux operating system
- Implement system security and access control in Linux operating system


**Question 3**

Implement system security and access control in Linux operating system.

Using Ubuntu OS, write and implement ONE (1) bash shell script (only one script should be written for whole Question 3). Copy the /etc/passwd file and /etc/group file into the same folder as your script and use the root account to execute the script. The script needs to execute on the “passwd” file and “group” file that have been copied to the folder, and not on the original /etc/passwd file and /etc/group file. That means some commands cannot be used in your script, such as id, getent, etc. You can assume that your script will not be executed in the /etc folder.

The bash shell script, which you need to name as tma.sh should have the following specifications:

**Question 3(a) (15 marks)**

![alt text](https://github.com/Born2Student/ICT246_JULY_2022_TMA01/blob/main/Figure_1.png?raw=true)


If the number of arguments is not equal to two, an error message will display, and the script will terminate.

2. It will check whether the format of the “passwd” file is in the correct format. If the format is not correct, an error message will prompt, and the script will terminate.

3. It will check whether the format of the “group” file is in the correct format. If the format is not correct, an error message will prompt, and the script will terminate.

4. It will create a file “userpassword” with only the user accounts details (you can assume that the user account is having a shell of /bin/bash or /bin/sh)

![alt text](https://github.com/Born2Student/ICT246_JULY_2022_TMA01/blob/main/Figure_2.png?raw=true)


**Question 3(b) (15 marks)**

1. The script will then display the content of “userpassword” file on screen

2. It will create a new file “combinepwgp” with the following format for each line:

![alt text](https://github.com/Born2Student/ICT246_JULY_2022_TMA01/blob/main/Figure_3.png?raw=true)

3. It will display the content of “combinepwgp” file on screen. The permissions and owner of the file “combinepwgp” will be displayed next on screen. (Note: the rest of information on the file, such as size, group, date, etc. should not be displayed)

4. It will then append the current date and time to the “combinepwgp” file in the format of DD-MM-YY:HH:mm (note: this should not be displayed on the screen)


**Question 3(c) (10 marks)**

1. The script will then display the following on screen:
  
  + total number of user accounts
  + largest user id among all the user accounts

2. The following will then be changed:

+ Owner and group of “userpassword” file to user ‘ubuntu’

+ Permissions of “userpassword” file to the owner can read, write and execute, and all others can only read

3. The owner, group and permissions of the file “combinepwgp” will be appended to the “combinepwgp” file in the format of owner:group:permissions (note: this should not be displayed on the screen)


**Question 3(d) (15 marks)**

A documentation (with appropriate screenshots and explanations) needs to be produced on the execution of the bash shell script with different conditions (e.g. correct number of arguments, incorrect number of arguments, etc.). Necessary checking needs to be done (e.g. check that the permissions of the file “userpassword” has changed, etc.).

Appropriate comments should be added in the script to make it easier to understand.

