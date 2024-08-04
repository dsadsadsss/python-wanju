import subprocess
import time
import os

def run_command(command):
    try:
        subprocess.call(command, shell=True)
        time.sleep(5)  # Wait for 5 seconds
    except subprocess.CalledProcessError as e:
        print(f"Error executing '{command}': {e}")
        print("Continuing with the script.")

# Update package lists
# run_command("apt-get update")

# Install procps
# run_command("apt-get install -y procps")

# Install curl
# run_command("apt-get install -y curl")

# Set execute permissions for start.sh
start_script = "./start.sh"
try:
    os.chmod(start_script, 0o755)
    print(f"Set execute permissions for '{start_script}'")
    time.sleep(5)  # Wait for 5 seconds
except Exception as e:
    print(f"Error setting execute permissions for '{start_script}': {e}")
    print("Continuing with the script.")

# Execute start.sh
run_command("./start.sh")

print("Script execution completed.")
