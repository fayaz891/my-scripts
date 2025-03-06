#!/bin/bash                  #path of interpreter(open this interpreter and execute below commands)

### This script prints system info ###

echo "echo means print"
echo "Welcome to bash script."
echo

#checking systemt uptime
echo "#####################################"
echo "The uptime of the system is: "
uptime
echo

# Memory Utilization
echo "#####################################"
echo "Memory Utilization"
free -m
echo

# Disk Utilization
echo "#####################################"
echo "Disk Utilization"
df -h
-----------------------------------------------------------------------------------------
#!/bin/bash

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo yum install wget unzip httpd -y > /dev/null
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
echo

# Bounce Service
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"
systemctl restart httpd
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd
ls /var/www/html/
----------------------------------------------------------------------------------------
#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo yum install $PACKAGE -y > /dev/null
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
echo

# Bounce Service
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"
systemctl restart $SVC
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html/
-----------------------------------------------------------------------------------------
#!/bin/bash

echo "Value of 0 is always the name of script"
echo $0

echo "Value of 1 is first arguments if defined in commandline arguments,if not then return empty"
echo $1

echo "Value of 2 is 2nd arg like i,e ./script.sh httpd linux, httpd first arg and linux 2nd"
echo $2

echo "Value of 3"
echo $3
----------------------------------------
./myscript.sh apple banana cherry
---
#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
---
output

Script name: ./myscript.sh
First argument: apple
Second argument: banana
---------------------------------------------------------------------------------------
#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
#URL='https://www.tooplate.com/zip-templates/2098_health.zip'   #these 2 are used in commandline arguments whic is passed by user
#ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"
sudo yum install $PACKAGE -y > /dev/null
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $1 > /dev/null
unzip $2.zip > /dev/null
sudo cp -r $2/* /var/www/html/
echo

# Bounce Service
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"
systemctl restart $SVC
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf $TEMPDIR
echo

sudo systemctl status $SVC
ls /var/www/html/
------------------------------------------------------------------------------------
#!/bin/bash

echo "Welcome $USER on $HOSTNAME."
echo "#######################################################"
# awk is a powerful text processing tool in Unix-like operating systems. awk is a programming language designed specifically for searching and manipulating text based on patterns.
#awk 'NR == 5 {print $7}' filename.txt    (print line 5, column 7 in filename.txt)

FREERAM=$(free -m | grep Mem | awk '{print $4}')
FREERAM1=$(free -m | awk 'NR == 3 {print $4}')

LOAD=`uptime | awk '{print $9}'`
ROOTFREE=$(df -h | grep '/dev/sda1' | awk '{print $4}')


echo "#######################################################"
echo "Available free RAM is $FREERAM MB"
echo "Available free RAM is $FREERAM1 swap"
echo "#######################################################"
echo "Current Load Average $LOAD"
echo "#######################################################"
echo "Free ROOT partiotion size is $ROOTFREE"
-----------------------------------------------------------------------------------
#!/bin/bash

echo "Enter your skills:"
read SKILL                 #user input save in this variable

echo "Your $SKILL skill is in high Demand in the IT Industry."

read -p 'Username: ' USR    #-p means prompt username: usr input save in USR
read -sp 'Password: ' pass  #-sp means supress prompt, cant see input words

echo

echo "Login Successfull: Welcome USER $USR,"
-----------------------------------------------------------------------------
#!/bin/bash

read -p "Enter a number: " NUM
echo

if [ $NUM -gt 100 ]
then
   echo "We have entered in IF block."
   sleep 3
   echo "Your Number is greater than 100"
   echo
   date
fi


echo "Script execution completed successfully."
---------------------------------------------------------------------------
#!/bin/bash

read -p "Enter a number: " NUM
echo

if [ $NUM -gt 100 ]
then
   echo "We have entered in IF block."
   sleep 3
   echo "Your Number is greater than 100"
   echo
   date
else
  echo "You have entered number less than 100."
fi


echo "Script execution completed successfully."
-------------------------------------------------------------------------
#!/bin/bash

value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $value -eq 1 ]
then
  echo "1 Active Network Interface found."
elif [ $value -gt 1 ]
then
  echo "Found Multiple active Interface."
else
  echo "No Active interface found."
fi

--------------------------------------------------------
#!/bin/bash

echo "#####################################################"
date 
ls /var/run/httpd/httpd.pid &> /dev/null


#the below script is used for above command ls, if present return 0 if not then return 1
if [ $? -eq 0 ]
then
   echo "Httpd process is running."
else
   echo "Httpd process is NOT Running."
   echo "Starting the process"
   systemctl start httpd 
   if [ $? -eq 0 ]
   then
      echo "Process started successfully."
   else
      echo "Process Starting Failed, contact the admin."
   fi
fi
echo "#####################################################"
echo 
---------------------------------------------------------------------------
#!/bin/bash

echo "#####################################################"
date 
#ls /var/run/httpd/httpd.pid &> /dev/null

if [ -f /var/run/httpd/httpd.pid ]
then
   echo "Httpd process is running."
else
   echo "Httpd process is NOT Running."
   echo "Starting the process"
   systemctl start httpd 
   if [ $? -eq 0 ]
   then
      echo "Process started successfully."
   else
      echo "Process Starting Failed, contact the admin."
   fi
fi
echo "#####################################################"
echo 
---------------------------------------------------------------------------
#!/bin/bash

for VAR1 in java .net python ruby php
do
  echo "Looping....."
  sleep 1
  echo "###################################################"
  echo "Value of VAR1 is $VAR1."
  echo "###################################################"
  date
  echo
done
-----------------------------------------------------------------------
#!/bin/bash

MYUSERS="alpha beta gamma"

for usr in $MYUSERS
do 
   echo "Adding user $usr."
   useradd $usr
   id $usr
   echo "#####################################"
done

---------------------------------------------

#!/bin/bash

counter=0

while [ $counter -lt 5 ]
do
  echo "Looping...."
  echo "Value of counter is $counter."
  counter=$(( $counter + 1 ))
  sleep 1
done

echo "Out of the loop"
----------------------------------------------------------
#!/bin/bash

counter=2

while true
do
  echo "Looping...."
  echo "Value of counter is $counter."
  counter=$(( $counter * 2 ))
  sleep 1
done

echo "Out of the loop"
------------------------------------------------------------
#!/bin/bash
sudo systemctl stop httpd
sudo rm -rf /var/www/html/*
sudo yum remove httpd wget unzip -y

-----------------------------------------------------------
#!/bin/bash

echo "The $SEASON season is more than expected, this time."
