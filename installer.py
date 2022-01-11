import datetime
import subprocess

log_file = open("logs.log", "a")

def log(message: str) -> None:
    text = str(datetime.datetime.now()) + ": " + message + "\n"
    print(text, end="")
    log_file.write(text)

log("Checking to see if package 'MariaDB' is installed...")
check_stat_proc = subprocess.run(["dpkg", "-s", "mariadb"], capture_output=True, text=True)

if "Status: install ok installed" in check_stat_proc.stdout:
    log("Package 'MariaDB' is already installed")
else:
    log("Package 'MariaDB' is not installed")
    log("Installing...")
    install_proc = subprocess.run(["pkg", "in", "mariadb", "-y"])
    code = install_proc.returncode
    if code == 0:
        log("Installation complete")
    else:
        if code == 100:
            log("Could not locate package 'MariaDB'")
        else:
            log(f"Some unkown error occured during installation (code:{code})")
        log("Failed to install package 'MariaDB'")

for fname in ["setpass", "start-client", "start-server"]:
    mk_exec_proc = subprocess.run(["chmod", "u+x", f"{fname}.sh"])
    code = mk_exec_proc.returncode
    if code == 0:
        log(f"Made '{fname}.sh' executable successfully")
    else:
        log(f"Failed to make '{fname}.sh' executable (code:{code})")

    with open("/data/data/com.termux/files/usr/etc/bash.bashrc", "r+") as file:
        log(f"Checking to see if alias {fname} exists...")
        contents = file.read()
        if fname in contents:
            log(f"Alias '{fname}' already exists")
        else:
            log(f"Alias '{fname}' does not exist")
            log(f"Creating alias '{fname}'...")
            try:
                file.write(f"alias {fname}=\"~/mysql-for-termux/{fname}.sh\"\n")
            except Exception as e:
                log(f"Failed to create alias '${fname}' (message: {e.args[0]})")
            else:
                log(f"Alias '{fname}' created successfully")

subprocess.run(["source", "data/data/com.termux/files/usr/etc/bash.bashrc"])

start_server_proc = subprocess.run(["start-server"])
code = start_server_proc.returncode
if code == 0:
    log("MySQL server started successfully")
else:
    log(f"MySQL server failed to start (code:{code})")

acquire_wakelock_proc = subprocess.run(["termux-wake-lock"])
code = acquire_wakelock_proc.returncode
if code == 0:
    log("Wakelock acquired successfully")
else:
    log(f"Failed to acquire wakelock (code:{code})")

print("MySQL installed successfully")

log_file.close()
