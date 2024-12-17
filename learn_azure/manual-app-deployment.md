# Deployment

## Manual Deployment

The requirements are:

1. Ubuntu 22.04 LTS
2. Nginx (web server)
3. NodeJs 20.0x
4. App code
5. Port 3000

You do 1 and 5 when setting
You do 2, 3 and 4 inside the VM

### Create a new VM

- Name: cloudfun1-rasheed-uks-sparta-app
- Image: Ubuntu Server 22.04 LTS x64 Gen2
- Change the username to something else: **rasheed-admin-user**
- Subnet: `public-subnet (10.0.2.0/24)`
- NIC network security group: `Advanced`
- Configure network security group: Click `Create new`
  - Name: `cloudfun1-rasheed-uks-sparta-app-nsg`
  - Click `Add an inbound rule`
  - Any
  - Destination port ranges: 80
  - Destination port ranges: 3000
  - Press OK
- Then continue

### SSH into the VM

- ssh -i cloudfun1-rasheed-az-key rasheed-admin-user@20.68.162.223
- uname -a => you should see your nginx server
- `sudo apt update -y` => this command tells us that
- 1 we can connect to the internet. 2. we want to get the latest packages 3. It's safe.
- `sudo apt upgrade -y`
- You see a purple screen with Daemons using outdated libraries
- Press Enter to cancel
- This is a problem because we can't automate it.
- A quick fix is to use the command below. You shouldn't see the purple screen
- `sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y`
- This command forces it not to bring up the purple screen.
- `sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y`
- `curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh`
- `sudo DEBIAN_FRONTEND=noninteractive bash setup_nodejs.sh`
- `sudo DEBIAN_FRONTEND=noninteractive apt-get install nodejs -y`

### Get the app code onto our virtual machine

- Download the zip app code onto your local machine
- From your local machine run the following code from the git-bash terminal
- You can put your zip file inside the `.ssh` file and run the command below.

- If using scs => `scp -i <path_to_your_ssh_key> <path_to_the_app.zip> <your_vm_username_used_to_ssh>@<vm_ip_address>:/path/to/destination/folder/on/the/vm`
- Example: `scp -i ~/.ssh/cloudfun1-rasheed-az-key nodejs20-sparta-test-app.zip rasheed-admin-user@51.142.8.97:/home/rasheed-admin-user`

- ls => you should see the zip file inside your vm in the /home/rasheed-admin-user
 directory
- Connect to the Azure VM and use ssh to log in to the VM
- `ssh -i cloudfun1-rasheed-az-key rasheed-admin-user@20.68.162.223`
- `sudo DEBIAN_FRONTEND=noninteractive apt install unzip`
- `unzip nodejs20-sparta-test-app.zip` => Unzip the ZIP file
- cd app => Navigate into the unzipped app folder
- npm start => If there’s a start script in package.json
- node app.js => Otherwise, directly run the main file (e.g., app.js)

### Check that your app works

- Copy the public ip of the vm from Azure and edit it to look like this:
- `<public-ip-of-vm:3000>`
- `http://51.142.8.97:3000/` => You should see the app page.
- To exit the app: CTRL+C

### Get the 'app' folder onto the Azure VM using "git"

- Log in to the Azure VM
- `ssh -i /path/to/your/private/key username@vm_ip_address`
- Install Git on the VM
- `sudo DEBIAN_FRONTEND=noninteractive apt update -y`
- `sudo DEBIAN_FRONTEND=noninteractive apt install git -y`
- Navigate to the directory where you want to clone the repo
- `cd /home/username`
- Clone the repository using the HTTPS URL
- `git clone https://github.com/your-username/your-repository.git`

If the repo is private, you’ll need to enter your GitHub credentials or use an SSH key (see next step)

### (Optional) Clone using SSH (for private repos)

- Add your Azure VM's SSH key to your GitHub account
- Add the public key to your GitHub account under Settings > SSH and GPG keys
- Clone the repo using the SSH URL
- `git clone git@github.com:your-username/your-repository.git`
- After cloning, move into the app directory:
- `cd your-repository`
- Install Node.js (if not already installed):
- `sudo DEBIAN_FRONTEND=noninteractive apt install nodejs npm -y`
- Install dependencies
- `npm install`
- If there’s a start script:
- `npm start`
- Or directly:
- `node app.js`

