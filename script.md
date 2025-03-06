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


Here are some examples of different types of loops in shell scripting:

---

### 1. **For Loop (Iterating Over a List)**
```bash
#!/bin/bash

for item in Apple Banana Cherry Mango
do
    echo "Fruit: $item"
    sleep 1
done
```
**Output:**
```
Fruit: Apple
Fruit: Banana
Fruit: Cherry
Fruit: Mango
```

---

### 2. **For Loop (Iterating Over a Range of Numbers)**
```bash
#!/bin/bash

for num in {1..5}
do
    echo "Number: $num"
done
```
**Output:**
```
Number: 1
Number: 2
Number: 3
Number: 4
Number: 5
```

---

### 3. **For Loop (Using C-Style Syntax)**
```bash
#!/bin/bash

for ((i=1; i<=5; i++))
do
    echo "Iteration $i"
done
```
**Output:**
```
Iteration 1
Iteration 2
Iteration 3
Iteration 4
Iteration 5
```

---

### 4. **While Loop (Basic Example)**
```bash
#!/bin/bash

counter=1

while [ $counter -le 5 ]
do
    echo "Counter: $counter"
    ((counter++))
    sleep 1
done

echo "Loop completed."
```
**Output:**
```
Counter: 1
Counter: 2
Counter: 3
Counter: 4
Counter: 5
Loop completed.
```

---

### 5. **Infinite While Loop**
```bash
#!/bin/bash

while true
do
    echo "Press Ctrl+C to stop the loop."
    sleep 2
done
```
> This loop will run forever until manually stopped using **Ctrl+C**.

---

### 6. **Until Loop**
```bash
#!/bin/bash

count=1

until [ $count -gt 5 ]
do
    echo "Count: $count"
    ((count++))
    sleep 1
done
```
**Output:**
```
Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```
> The `until` loop runs until the condition becomes **true**.

---

### 7. **Break Statement in a Loop**
```bash
#!/bin/bash

for num in {1..10}
do
    if [ $num -eq 6 ]; then
        echo "Breaking the loop at number $num"
        break
    fi
    echo "Processing number: $num"
done
```
**Output:**
```
Processing number: 1
Processing number: 2
Processing number: 3
Processing number: 4
Processing number: 5
Breaking the loop at number 6
```

---

### 8. **Continue Statement in a Loop**
```bash
#!/bin/bash

for num in {1..5}
do
    if [ $num -eq 3 ]; then
        echo "Skipping number $num"
        continue
    fi
    echo "Processing number: $num"
done
```
**Output:**
```
Processing number: 1
Processing number: 2
Skipping number 3
Processing number: 4
Processing number: 5
```
> The `continue` statement skips the current iteration and moves to the next one.

---

### 9. **Looping Through Files in a Directory**
```bash
#!/bin/bash

for file in /etc/*.conf
do
    echo "Configuration file: $file"
done
```
> This script lists all `.conf` files inside the `/etc/` directory.

---

### 10. **Nested Loops**
```bash
#!/bin/bash

for i in {1..3}
do
    for j in {1..3}
    do
        echo "Outer loop: $i, Inner loop: $j"
    done
done
```
**Output:**
```
Outer loop: 1, Inner loop: 1
Outer loop: 1, Inner loop: 2
Outer loop: 1, Inner loop: 3
Outer loop: 2, Inner loop: 1
Outer loop: 2, Inner loop: 2
Outer loop: 2, Inner loop: 3
Outer loop: 3, Inner loop: 1
Outer loop: 3, Inner loop: 2
Outer loop: 3, Inner loop: 3
```

---

Let me know if you need more examples! 😊
