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
# URL="https://www.tooplate.com/zip-templates/2098_health.zip"
# ART_NAME="2098_health"
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

```
./script.sh https://www.tooplate.com/zip-templates/2098_health.zip 2098_health

./script.sh 1stArg 2ndArg

i.e in script $1 $2
wget $1 > /dev/null
unzip $2.zip > /dev/null
```
---
In Linux, when you execute a command, it returns an **exit status code**. You can check the exit status of the last executed command using `$?`.  

### Example:

#### ✅ **Successful Command**
```bash
$ echo "fayaz"
fayaz

$ echo $?
0
```
- `echo "fayaz"` runs successfully.
- `$?` returns `0`, indicating success.

#### ❌ **Failed Command**
```bash
$ ecoh "fayaz"
bash: ecoh: command not found

$ echo $?
127
```
- `ecoh "fayaz"` is an incorrect command (typo in `echo`).
- `$?` returns `127` (or another non-zero value), indicating failure.

### **Exit Status Code Meaning:**
- `0` → Success ✅
- `1-255` → Failure/Error ❌  
  - `127` → Command not found  
  - `1` → General error  
  - `2` → Incorrect usage  


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


---

### **Usage of Double Quotes (`"`) vs. Single Quotes (`'`) in Bash**

In Bash scripting, **double quotes (`"`)** and **single quotes (`'`)** behave differently:

#### **Example 1: Variable Expansion**
```bash
#!/bin/bash

VAR="Hello, World!"

echo "Double Quotes: $VAR"  # ✅ Expands $VAR
echo 'Single Quotes: $VAR'  # ❌ Prints $VAR as is (no expansion)
```
**Output:**
```
Double Quotes: Hello, World!
Single Quotes: $VAR
```

#### **Example 2: Command Substitution**
```bash
#!/bin/bash

echo "Today is $(date)"   # ✅ Works inside double quotes
echo 'Today is $(date)'   # ❌ Prints $(date) as text
```
**Output:**
```
Today is Thu Mar 6 12:00:00 UTC 2025
Today is $(date)
```

#### **Example 3: Escape Sequences**
```bash
echo "Line1\nLine2"   # ✅ Prints with newline
echo 'Line1\nLine2'   # ❌ Prints \n as text
```
**Output:**
```
Line1
Line2
Line1\nLine2
```

---

### **Storing System Variable in a Variable**
You can store system environment variables or command outputs in a variable.

#### **Example 1: Store System Variable**
```bash
USERNAME=$USER
HOSTNAME=$HOSTNAME

echo "User: $USERNAME"
echo "Host: $HOSTNAME"
```

#### **Example 2: Store Command Output**
```bash
CURRENT_DATE=$(date)
UPTIME_INFO=$(uptime)

echo "Current Date: $CURRENT_DATE"
echo "System Uptime: $UPTIME_INFO"
```
---
### **Usage of `export` in Bash**
The `export` command in Bash is used to make a variable available to child processes (subshells). Without `export`, a variable is only accessible within the current shell session.

#### **Example 1: Without `export` (Variable Not Available in Subshell)**
```bash
VAR="Hello"
bash  # Open a new subshell
echo $VAR  # ❌ Will not print anything because VAR is not exported
```

#### **Example 2: With `export` (Variable Available in Subshell)**
```bash
export VAR="Hello"
bash  # Open a new subshell
echo $VAR  # ✅ Will print "Hello" because VAR is exported
```

---

### **How to Make Variables Permanent in Bash**
By default, variables are lost when you close the terminal. To make them **permanent**, you need to store them in a configuration file that loads when a new session starts.

#### **Method 1: Save Variables in `~/.bashrc` (For Interactive Shells)**
1. Open `~/.bashrc` file:
   ```bash
   nano ~/.bashrc
   ```
2. Add your variables at the end of the file:
   ```bash
   export MY_VAR="This is a permanent variable"
   ```
3. Save and exit (Press `CTRL+X`, then `Y`, then `ENTER`).
4. Apply changes immediately (or restart terminal):
   ```bash
   source ~/.bashrc
   ```
5. Now, `MY_VAR` is available in every new session:
   ```bash
   echo $MY_VAR
   ```

---

#### **Method 2: Save Variables in `~/.profile` (For Login Shells)**
If `~/.bashrc` doesn't work (e.g., for SSH sessions), use `~/.profile`:
1. Open `~/.profile`:
   ```bash
   nano ~/.profile
   ```
2. Add your variable:
   ```bash
   export MY_VAR="Persistent Value"
   ```
3. Save, exit, and reload:
   ```bash
   source ~/.profile
   ```

---

#### **Method 3: Save System-Wide Variables in `/etc/environment`**
If you want the variable to be **available for all users** on the system:
1. Edit `/etc/environment` (requires sudo):
   ```bash
   sudo nano /etc/environment
   ```
2. Add the variable (without `export`):
   ```bash
   MY_GLOBAL_VAR="System-wide persistent value"
   ```
3. Save, exit, and reboot for changes to take effect.

---

### **Which Method to Use?**
| Scenario | File to Edit |
|----------|-------------|
| For a single user in interactive shells | `~/.bashrc` |
| For a single user in login shells (like SSH) | `~/.profile` or `~/.bash_profile` |
| For all users (system-wide) | `/etc/environment` |

---
---
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

## **9. Check Multiple Conditions**
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
---
Sure! Here's a **Bash script** that explains and demonstrates various operators and conditions in Bash scripting:  

```bash
#!/bin/bash

echo "### Bash Operators and Conditions ###"

# 1. Check if a file exists (-f)
file="example.txt"
if [ -f "$file" ]; then
    echo "$file exists."
else
    echo "$file does not exist."
fi

# 2. Check if a directory exists (-d)
dir="testdir"
if [ -d "$dir" ]; then
    echo "$dir exists."
else
    echo "$dir does not exist."
fi

# 3. Check if a file is readable (-r)
if [ -r "$file" ]; then
    echo "$file is readable."
else
    echo "$file is not readable."
fi

# 4. Check if a file is writable (-w)
if [ -w "$file" ]; then
    echo "$file is writable."
else
    echo "$file is not writable."
fi

# 5. Check if a file is executable (-x)
if [ -x "$file" ]; then
    echo "$file is executable."
else
    echo "$file is not executable."
fi

# 6. Check if a variable is not empty (-n)
var1="Hello"
if [ -n "$var1" ]; then
    echo "var1 is not empty."
else
    echo "var1 is empty."
fi

# 7. Check if a variable is empty (-z)
var2=""
if [ -z "$var2" ]; then
    echo "var2 is empty."
else
    echo "var2 is not empty."
fi

# 8. Integer comparison (greater than -gt, less than -lt, equal -eq, not equal !=)
num1=10
num2=20

if [ $num1 -gt $num2 ]; then
    echo "$num1 is greater than $num2."
elif [ $num1 -lt $num2 ]; then
    echo "$num1 is less than $num2."
else
    echo "$num1 is equal to $num2."
fi

# 9. Negation using ! (Not operator)
if [ ! -f "nonexistent.txt" ]; then
    echo "nonexistent.txt does not exist."
fi

# 10. Combining conditions with && (AND) and || (OR)
if [ -f "$file" ] && [ -w "$file" ]; then
    echo "$file exists and is writable."
fi

if [ -d "$dir" ] || [ -f "$file" ]; then
    echo "Either $dir exists, or $file exists."
fi
```

---

### **Explanation of Operators in the Script**
| Operator | Description |
|----------|-------------|
| `-f` | Checks if a file exists |
| `-d` | Checks if a directory exists |
| `-r` | Checks if a file is readable |
| `-w` | Checks if a file is writable |
| `-x` | Checks if a file is executable |
| `-n` | Checks if a string is **not empty** |
| `-z` | Checks if a string is **empty** |
| `-gt` | Greater than (for numbers) |
| `-lt` | Less than (for numbers) |
| `-eq` | Equal to (for numbers) |
| `!=` | Not equal (for numbers) |
| `!` | Logical NOT (negates a condition) |
| `&&` | Logical AND (both conditions must be true) |
| `||` | Logical OR (at least one condition must be true) |

---

### **How to Run the Script**
1. Save this script as `bash_conditions.sh`
2. Give it execute permission:
   ```bash
   chmod +x bash_conditions.sh
   ```
3. Run the script:
   ```bash
   ./bash_conditions.sh
   ```

This will demonstrate all the conditions in action! 🚀 Let me know if you need any modifications. 😊
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
---
---
To execute remote commands from your **laptop** to a **remote server**, you can use **SSH** (`Secure Shell`). Below are different ways to run commands remotely.

---

### **1. Execute a Single Command on a Remote Server**
```bash
ssh user@remote_host "ls -l /var/www"
```
- This lists files in `/var/www` on the **remote server**.
- Replace `user` with your **remote username**.
- Replace `remote_host` with the **server IP or domain**.

---

### **2. Run Multiple Commands on the Remote Server**
```bash
ssh user@remote_host "cd /var/www && ls -l && pwd"
```
- Runs multiple commands in sequence.

Or using a **here document**:
```bash
ssh user@remote_host << EOF
cd /var/www
ls -l
whoami
EOF
```

---

### **3. Execute a Script on a Remote Server**
#### **Method 1: Run a Script Without Copying**
```bash
ssh user@remote_host 'bash -s' < myscript.sh
```
- This runs `myscript.sh` on the remote server **without copying it**.

#### **Method 2: Copy and Then Run**
```bash
scp myscript.sh user@remote_host:/home/user/
ssh user@remote_host "bash /home/user/myscript.sh"
```
- This first copies the script to the remote server, then runs it.

---

### **4. Run Commands as Root (sudo)**
If you need **sudo privileges**, use:
```bash
ssh user@remote_host "echo 'your_password' | sudo -S apt update"
```
Or if you have **passwordless sudo**, simply run:
```bash
ssh user@remote_host "sudo apt update"
```

---

### **5. Run Remote Command and Store Output on Your Laptop**
```bash
result=$(ssh user@remote_host "hostname")
echo "Remote server name: $result"
```

---

### **6. Using SSH Key for Passwordless Authentication**
If you don’t want to enter the password every time:
1. Generate an SSH key on your laptop:
   ```bash
   ssh-keygen -t rsa -b 4096
   ```
2. Copy the public key to the remote server:
   ```bash
   ssh-copy-id user@remote_host
   ssh-copy-id user@remote_host1
   ssh-copy-id user@remote_host3
   ssh-copy-id user@remote_host4
   ```
3. Now, SSH without a password:
   ```bash
   ssh user@remote_host
   ssh user@remote_host1
   ssh user@remote_host2
   ssh user@remote_host3
   ssh user@remote_host4
   ```

---

### **7. Run Commands on Multiple Remote Servers**
If you have multiple remote servers, you can execute commands on all of them:
```bash
for server in server1.com server2.com server3.com; do
    ssh user@$server "uptime"
done
```

---

### **8. Run a Background Process on a Remote Server**
```bash
ssh user@remote_host "nohup ./long_script.sh > output.log 2>&1 &"
```
- Runs a **long-running script** in the **background** and **detaches** from SSH.

---

---
