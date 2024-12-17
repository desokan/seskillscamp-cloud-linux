# Linux notes

## Important Linux Commands

- cat => output content of a file
- uname => version of linux
- uname --help
- uname --processor
- uname -s -n -m -p -o
- uname -snmpo => same output as above
- whoami
- cat /etc/shells => shows available shells
- ps -p $$ => check what shell you are currently using ps = processes, p = show specific process
- history
- !10 => runs the specified number of commands as in your history
- history -c => clears all your history in case you have typed things you don't want others to see
- history
- ls -a => `.` = current directory and `..` = directory above the `.`
- ls -al

## Linux command for downloading

- `curl https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg --output cat.jpg`
- works with `-o` or `--output` options.
- `wget https://cdn.britannica.com/39/7139-050-A88818BB/Himalayan-chocolate-point.jpg -O cat2.jpg`
- wget uses capital `O`.
- `file cat.jpg`=> shows file type.
- `mv cat.jpg cat` => renames cat.jpg to cat
- `file cat` => it still knows the type even without the extension. Linux doesn't care about the extension.
- `mv cat cat.txt`
- `file cat.txt` => it still knows the format not to be txt

## Copying & Deleting Files

- cp file_to_copy new_name
- `cp cat.jpg newcat.jpg`
- `rm cat.jpg` => delete files
- `mkdir file1 file2` => can create multiple files in one go
- `rm -r file1 file2` => -r means recurive and it goes deep inside the folder
- `rm -rf file1` => be very careful when using the -f flag.
- `mkdir 'my pictures`' => this allows free space
- cd 'my pictures' => when referencing it, you must use the quote.

## Directory

- `mkdir funny-stuff`
- `cd funny-stuff` then `mkdir funny-jokes`
- `mkdir funny-stuff/funny-jokes` => the above in a single line
- `cd ..`
- `tree`
- `mv chicken-joke.txt funny-stuff`
- `tree`
- `mv /funny-stuff/chicken-joke.txt .` => this won't work because it's checking in the root folder (/)
- `mv funny-stuff/chicken-joke.txt .` => moves the file to the root
- `mv chicken-joke.txt funny-stuff/funny-jokes`
- `mv chicken-joke.txt bad-joke.txt`
- `mv bad-joke.txt ..` => moves it up one level into funny-stuff
- `rm -r funny-stuff`

## Create files

- `touch chicken-joke.txt`
- `nano chicken-joke.txt` => if chicken-joke.txt doesn't exist, it will create it
- To save => `Ctrl + S`
- The to exit => `Ctrl +X`
- To exit and save Ctrl + S
- You may need to press Y
- Enter

## File manipulation

- `head -3 chicken-joke.txt` => it shows the top 3 lines
- `tail -3 chicken-joke.txt` => it shows the bottom 3 lines
- `nl chicken-joke.txt` => it will number line the file
- `cat chicken-joke.txt | grep chicken` => it will search for chicken in the file

## Installing Packages

Note that you are inside a virtual machine

- `apt install tree` => you won't be able to because you are changing the system
- You need to be a root user to run the apt command. So, sudo => super-user-do
- `sudo apt install tree` => unable to locate package tree
- `sudo apt update -y` => this command saves the file but doesn't implement them. it's a save command
- `sudo apt upgrade -y` => be careful because it's not a save command. it upgrade straight away
- `sudo apt install tree` => this should now work
- `tree` => displays the content of your directory in a tree-like pattern
- pwd => `/home/rasheed-admin-user` => this is your home directory
- `~` => this indicates that you are in the home directory
- `cd ~`
- `cd /` => this takes you to the root
- pwd
- `sudo su` => logs in as a super user => `su` means switch user
- whoami
- cd /root
- pwd
- exit
- ls
- cd ~ => takes you back to home directory

## Provisioning a Server

- Open one more git bash terminal in an admin mode. SSH to your Azure Virtual Machine

- 1. Original Terminal
- nano provision.sh
- Enter the code below in the script `#!` means `shebang`. `/bin/bash` specifies the shell to use
- The idea is to run all the code manually in the second terminal before creating your script. Save the script and it's ready for reuse.

```sh => profision.sh

#!/bin/bash

# update
sudo apt update -y

# upgrade
sudo apt upgrade -y

# install nginx
sudo apt install nginx -y

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo enable restart nginx
```

Restart => combines stop and start
Enable => it will enable it on startup. it will start it automatically

- Ctrl + S
- Ctrl + X

### Executing the Script

- `.` => we use dot in the code below if the script is inside your current directory
- `./provision.sh` => this will fail due to permission
- `sudo chmod +x provision.sh`
- `./provision.sh`
- `bash provision.sh` => another way to execute the script

### Checking your Provision

- Once done, go to Azure, open your virutal machine
- Click Overview
- Copy the Public IP address and paste it in the browser.
- You should see your `nginx` server web page.

## Systemctl

- sudo systemctl status nginx
- press q to exit
- sudo systemctl stop nginx
- sudo systemctl status nginx
- sudo systemctl start nginx
- sudo systemctl restart nginx => use after maybe changing configuration
- sudo systemctl enable nginx

## What is Linux

It's a clone of UNIX.
Made of kernels (its OS)

## Benefits of Linux

Fast growing
Can be customised
Scalable
Versatile: run on servers, desktops, iot devices, phones
Popular in cloud and DevOps
