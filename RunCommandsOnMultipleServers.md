**Here’s a Bash script to run commands on multiple servers using SSH.**


### **How It Works:**
- The script uses `ssh-copy-id`, which **copies your public key (`~/.ssh/id_rsa.pub`) to the remote server’s `~/.ssh/authorized_keys` file**.
- Once added, your laptop can log in **without a password** indefinitely, **even after reboots**.
- The key does **not change every time** you run the script unless:
  - You delete and regenerate a new SSH key (`rm -f ~/.ssh/id_rsa* && ssh-keygen`).
  - You remove the key manually from the server (`~/.ssh/authorized_keys`).

### **Check if SSH Keys Already Exist**
Before running `ssh-copy-id`, the script should check if the key is already installed to avoid unnecessary operations.

### **Updated Script:**
```bash
#!/bin/bash

# List of servers
SERVERS=("server1.com" "server2.com" "server3.com")

# Remote user
USER="your_username"

# Commands to execute remotely
REMOTE_COMMANDS="
echo 'Running commands on: $(hostname)'
uptime
df -h
free -m
"

# Function to check and set up SSH keys if not present
setup_ssh_keys() {
    echo "Setting up SSH keys for passwordless login..."
    if [ ! -f ~/.ssh/id_rsa.pub ]; then
        echo "SSH key not found, generating one..."
        ssh-keygen -t rsa -b 4096 -N "" -f ~/.ssh/id_rsa
    fi

    for SERVER in "${SERVERS[@]}"; do
        ssh -o BatchMode=yes -o ConnectTimeout=5 "$USER@$SERVER" "exit" 2>/dev/null
        if [ $? -ne 0 ]; then
            echo "Copying SSH key to $SERVER..."
            ssh-copy-id -o StrictHostKeyChecking=no "$USER@$SERVER"
        else
            echo "SSH key already exists on $SERVER, skipping."
        fi
    done
}

# Function to execute commands on all servers sequentially
run_commands_sequentially() {
    for SERVER in "${SERVERS[@]}"; do
        echo "Executing on $SERVER..."
        ssh "$USER@$SERVER" "$REMOTE_COMMANDS"
        echo "-------------------------------------"
    done
}

# Function to execute commands on all servers in parallel
run_commands_parallel() {
    echo "Executing commands in parallel..."
    for SERVER in "${SERVERS[@]}"; do
        ssh "$USER@$SERVER" "$REMOTE_COMMANDS" &
    done
    wait
}

# Main execution
setup_ssh_keys
run_commands_sequentially
run_commands_parallel | tee remote_output.log  # Save output to a log file
```

### **🔹 What’s Improved?**
1. **Prevents duplicate SSH key installations**:
   - Checks if you already have an SSH key (`~/.ssh/id_rsa.pub`).
   - Checks if the key is already on the server before running `ssh-copy-id`.

2. **Automatically generates an SSH key** (if missing).

3. **Ensures the script runs without manual intervention**.

### **✅ Permanent SSH Access**
- **Once the key is installed, it stays there**.
- **No need to run `ssh-copy-id` again unless the server is rebuilt** or the key is removed.

Let me know if you need any changes! 🚀
---
---
---

**OS Detection: Automatically detects if the system is CentOS or Ubuntu.**
```

#!/bin/bash

# Define variables
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Detect OS and set package names
if command -v yum &> /dev/null; then
    OS="CentOS"
    PACKAGE="httpd wget unzip"
    SVC="httpd"
elif command -v apt &> /dev/null; then
    OS="Ubuntu"
    PACKAGE="apache2 wget unzip"
    SVC="apache2"
else
    echo "Unsupported OS. Exiting."
    exit 1
fi

echo "########################################"
echo "Running Setup on $OS"
echo "########################################"

# Installing dependencies
echo "Installing required packages..."
if [ "$OS" == "CentOS" ]; then
    sudo yum install -y $PACKAGE > /dev/null
else
    sudo apt update -y > /dev/null
    sudo apt install -y $PACKAGE > /dev/null
fi
echo "Packages installed successfully."
echo

# Start & Enable HTTP service
echo "Starting and enabling $SVC service..."
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo "$SVC service started and enabled."
echo

# Create temporary directory
echo "Creating temporary directory: $TEMPDIR"
mkdir -p $TEMPDIR && cd $TEMPDIR

# Download and extract artifact
echo "Downloading web template..."
wget -q $URL
if [ $? -ne 0 ]; then
    echo "Failed to download $URL. Exiting."
    exit 1
fi

echo "Extracting web template..."
unzip -q $ART_NAME.zip
if [ $? -ne 0 ]; then
    echo "Failed to extract $ART_NAME.zip. Exiting."
    exit 1
fi

# Deploy files
echo "Deploying files to /var/www/html/..."
sudo cp -r $ART_NAME/* /var/www/html/
echo "Deployment complete."
echo

# Restart service
echo "Restarting $SVC service..."
sudo systemctl restart $SVC
echo "$SVC service restarted."
echo

# Clean up temporary files
echo "Cleaning up temporary files..."
rm -rf $TEMPDIR
echo "Cleanup complete."
echo

# Show service status and verify deployment
echo "########################################"
echo "Service Status:"
sudo systemctl status $SVC --no-pager
echo

echo "########################################"
echo "Deployed Files in /var/www/html/:"
ls -lh /var/www/html/
echo "########################################"
```
