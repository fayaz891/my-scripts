Here's your script collection in a well-formatted and structured way:  

---

## **1. System Information Script**
```bash
#!/bin/bash

# This script prints system information

echo "echo means print"
echo "Welcome to bash script."
echo

# Checking system uptime
echo "#####################################"
echo "The uptime of the system is:"
uptime
echo

# Memory Utilization
echo "#####################################"
echo "Memory Utilization:"
free -m
echo

# Disk Utilization
echo "#####################################"
echo "Disk Utilization:"
df -h
```
---

## **2. Install & Deploy Web Application**
```bash
#!/bin/bash

# Installing Dependencies
echo "########################################"
echo "Installing packages..."
echo "########################################"
sudo yum install wget unzip httpd -y > /dev/null
echo

# Start & Enable HTTPD Service
echo "########################################"
echo "Starting & Enabling HTTPD Service"
echo "########################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temporary Directory
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

# Restart HTTPD Service
echo "########################################"
echo "Restarting HTTPD Service"
echo "########################################"
systemctl restart httpd
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf /tmp/webfiles
echo

# Verify Deployment
sudo systemctl status httpd
ls /var/www/html/
```
---

## **3. Web Application Deployment with Variables**
```bash
#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME="2098_health"
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "########################################"
echo "Installing packages..."
echo "########################################"
sudo yum install $PACKAGE -y > /dev/null
echo

# Start & Enable HTTPD Service
echo "########################################"
echo "Starting & Enabling HTTPD Service"
echo "########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temporary Directory
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

# Restart HTTPD Service
echo "########################################"
echo "Restarting HTTPD Service"
echo "########################################"
systemctl restart $SVC
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf $TEMPDIR
echo

# Verify Deployment
sudo systemctl status $SVC
ls /var/www/html/
```
---

## **4. Script Arguments Example**
```bash
#!/bin/bash

echo "Script name: $0"
echo "First argument: $1"
echo "Second argument: $2"
```
### **Example Usage:**
```bash
./myscript.sh apple banana
```
**Output:**
```
Script name: ./myscript.sh
First argument: apple
Second argument: banana
```
---

## **5. Web Deployment with User Arguments**
```bash
#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "########################################"
echo "Installing packages..."
echo "########################################"
sudo yum install $PACKAGE -y > /dev/null
echo

# Start & Enable HTTPD Service
echo "########################################"
echo "Starting & Enabling HTTPD Service"
echo "########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temporary Directory
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

# Restart HTTPD Service
echo "########################################"
echo "Restarting HTTPD Service"
echo "########################################"
systemctl restart $SVC
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"
rm -rf $TEMPDIR
echo

# Verify Deployment
sudo systemctl status $SVC
ls /var/www/html/
```
---

## **6. System Monitoring**
```bash
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
```
---

## **7. User Input Script**
```bash
#!/bin/bash

echo "Enter your skills:"
read SKILL

echo "Your $SKILL skill is in high demand in the IT industry."

read -p 'Username: ' USR
read -sp 'Password: ' PASS

echo
echo "Login Successful: Welcome, $USR!"
```
---

## **8. Conditional Check for Numbers**
```bash
#!/bin/bash

read -p "Enter a number: " NUM
echo

if [ $NUM -gt 100 ]; then
    echo "Your number is greater than 100."
    date
else
    echo "Your number is less than or equal to 100."
fi
```
---

## **9. Check Active Network Interfaces**
```bash
#!/bin/bash

value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $value -eq 1 ]; then
    echo "1 Active Network Interface found."
elif [ $value -gt 1 ]; then
    echo "Multiple active interfaces found."
else
    echo "No Active Interface found."
fi
```
---

## **10. Check & Start HTTPD Service**
```bash
#!/bin/bash

echo "#####################################################"
date 

if [ -f /var/run/httpd/httpd.pid ]; then
    echo "Httpd process is running."
else
    echo "Httpd process is NOT running. Starting the service..."
    systemctl start httpd
    if [ $? -eq 0 ]; then
        echo "Process started successfully."
    else
        echo "Process startup failed. Contact the administrator."
    fi
fi
echo "#####################################################"
```
---

## **11. Loop Examples**
### **For Loop**
```bash
#!/bin/bash

for VAR1 in java .net python ruby php
do
  echo "Processing..."
  sleep 1
  echo "Current Language: $VAR1"
  date
  echo
done
```

### **While Loop**
```bash
#!/bin/bash

counter=0

while [ $counter -lt 5 ]; do
  echo "Counter: $counter"
  counter=$((counter + 1))
  sleep 1
done

echo "Loop Completed."
```

### **Infinite While Loop**
```bash
#!/bin/bash

counter=2

while true; do
  echo "Counter: $counter"
  counter=$((counter * 2))
  sleep 1
done
```
---

## **12. Uninstall Web Application**
```bash
#!/bin/bash
sudo systemctl stop httpd
sudo rm -rf /var/www/html/*
sudo yum remove httpd wget unzip -y
```
---

This provides a structured and formatted version of your scripts. Let me know if you need further improvements! 🚀
