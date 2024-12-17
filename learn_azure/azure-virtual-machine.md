# Azure - Virtual Machine

git clone https://github.com/daraymonsta/tech201-sparta-app `repo`
npm start & => running sth in the background. You may need to run `kill` to kill the process

## Planning your VM

- SSH Key Pair
- Name of your VM
- Location and Pricing
  - Where are your end users?
  - Availability - uptime and downtime
  - Cost (regions have different pricing)
  - Compliance (GDPR means data must be stored in the EU)
  - Others
- Size
- Storage
- Operating System
  - Is a custom image needed (custom OS template)
- Virtual Network (Networking)

## Getting your public key to Azure

- Get your ssh public key on your local machine onto Azure
- In Azure, search for `SSH Keys` and select it
- Click Create
- Select Subscription
- Select Resource Group
- Region: UK South
- Key pair name: `cloudfun1-rasheed-az-key`
- SSH public key source: Select `Upload existing public key`
- Upload key: This is where we will paste the key
- Now, open your git bash terminal
- cd ~
- cd .ssh
- `cat cloudfun1-rasheed-az-key.pub`
- Copy the key. Make sure to include your email part.
- Avoid any blank spaces before and after the key.
- Paste it in the `Upload key` field.
- Click Next: Tags: owner: rasheed
- Click Review + create
- Click Create

## Creating a Virtual Machine

- Search for virtual machine and click it
- From the Create dropdown, select `Azure virtual maching`
- Select Subscription
- Select Resource group
- Virtual machine name: `cloudfun1-rasheed-uks-test-vm`
- Region: (Europe) UK South
- Availability options: select `Availability zone`
- Availability zone: select Zone 1
- Security type: Accept default or Standard
- Image: Select Ubuntu Server 22.04 LTS - x64 Gen2
- Alternatively, select `See all images` and search for Ubuntu
- Select Ubuntu Pro 18.04 LTS Gen2
- VM architecture: accept default `x64`
- Size: click `See all sizes`
- Then select `B1s` family and the click the `Select` button
- Authentication type: `SSH public key`
- Username: You get a default `azureuser`.
- Change the username to something else: **rasheed-admin-user**
- SSH public key source: select `Use existing key stored in Azure`
- Stored Keys: `cloudfun1-rasheed-az-key`
- Public inbound ports: Select `Allow selected ports`
- Select inbound ports: Select `SSH(22)`
- Click `Next: Disks`
  - OS disk type: Select `Standard SSD(locally-redundant-storage)`
  - Delete with VM: `Check the box`
  - For the rest, accept the default
    Click `Next: Networking`
- If you have an existing vnet, you can select it from the dropdown
- Virtual network: select `cloudfun1-rasheed-az-key`
  - Name: change the name to `cloudfun1-rasheed-uks-main-vnet`
  - VNet has Subnet inside it.
  - Every VNet has an Address range
  - Change it to `10.0.0.0/16`
  - Subnets: We will create two subnets. One private and one public
  - Subnet name: public-subnet => Address range: 10.0.2.0/24
  - Subnet name: private-subnet => Address range: 10.0.3.0/24
  - Click OK
- Subnet: select `private-subnet`
- NIC network security group: Basic
- Public inbound ports: Allow selected ports
- Select inbound ports: HTTPS, SSH
- Delete public IP and NIC when VM is deleted: Tick this box
- Click `Next: Management`
  - Accept default
- Click `Next: Monitoring`
  - Accept default
- Click `Next: Advanced`
  - Accept default
- Click `Next: Tags`
  - owner: rasheed
- Click `Review + create`
  - Then click Create

## Connect to the VM
- Open your VM and click Connect button
- Under Native SSH: Click Select
- Copy and execute SSH command:
- This time we are `~/.ssh/` to the code, and we can ssh from any location.
- `ssh -i ~/.ssh/cloudfun1-rasheed-az-key rasheed-admin-user@20.108.64.8`
- Are you sure you want to continue connecting: yes

## Provisioning a Server

- Open one more git bash terminal in an admin mode. SSH to your Azure Virtual Machine

- 1. Original Terminal
- nano provision.sh
- Enter the code below in the script `#!` means `shebang`. `/bin/bash` specifies the shell to use
- The idea is to run all the code manually in the second terminal before creating your script. Save the script and it's ready for reuse.

- `sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y`
- `curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_nodejs.sh`
- `sudo DEBIAN_FRONTEND=noninteractive bash setup_nodejs.sh`
- `sudo DEBIAN_FRONTEND=noninteractive apt-get install nodejs -y`

```sh => profision.sh
#!/bin/bash

# update
sudo DEBIAN_FRONTEND=noninteractive apt update -y

# upgrade
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# install nginx
sudo DEBIAN_FRONTEND=noninteractive apt install nginx -y

# restart nginx
sudo systemctl restart nginx

# enable nginx
sudo enable restart nginx
```

### Executing the Script

- `.` => we use dot in the code below if the script is inside your current directory
- `./provision.sh` => this will fail due to permission
- `sudo chmod +x provision.sh`
- `./provision.sh`
- `bash provision.sh` => another way to execute the script

### Checking your Provision

- Once done, go to Azure, open your virtual machine
- Click Overview
- Copy the Public IP address and paste it in the browser.
- You should see your `nginx` server web page.

## Delete the VM

- Select your VM and click the Delete button
- Virtual Machine
- Network Interface
- Dist

## Three things to bear in ind

What are we creating
Where are we creating it - region, vnet
How do we access it?
