import subprocess
import time
import os

# Update package lists
cmd1 = "apt-get update"
try:
    subprocess.call(cmd1, shell=True)
    time.sleep(5)  # Wait for 5 seconds
except subprocess.CalledProcessError as e:
    print(f"Error executing '{cmd1}': {e}")

# Install procps and curl
cmd2 = "apt-get install -y procps curl"
try:
    subprocess.call(cmd2, shell=True)
    time.sleep(5)  # Wait for 5 seconds
except subprocess.CalledProcessError as e:
    print(f"Error executing '{cmd2}': {e}")

# Set execute permissions for start.sh
start_script = "./start.sh"
try:
    os.chmod(start_script, 0o755)
    print(f"Set execute permissions for '{start_script}'")
    time.sleep(5)  # Wait for 5 seconds
except Exception as e:
    print(f"Error setting execute permissions for '{start_script}': {e}")

# Execute start.sh
cmd3 = "./start.sh"
try:
    subprocess.call(cmd3, shell=True)
    time.sleep(5)  # Wait for 5 seconds
except subprocess.CalledProcessError as e:
    print(f"Error executing '{cmd3}': {e}")
