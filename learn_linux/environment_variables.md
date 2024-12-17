# Environment Variables

First, ssh into your virtual machine

## Processes

- printenv => shows all environment variables in linux
- printenv user => wrong case so won't work
- printenv USER => USER in upper case
- MYNAME=rasheed => this creates a normal variable
- echo $MYNAME => should display your name, rasheed

- export MYNAME=rasheed => this creates an environment variable
- printenv MYNAME => no $ sign this time
- Logout of your
- printenv MYNAME => it will be lost as it does not persist

## MAKING A PERSISTIBLE ENVIRONMENT VARIABLE

- ls -a
- .bashrc => this is a configuration for your bash shell
- We will set our environment variable here to make it persist
- nano .bashrc
- Scroll to the botton and add
- export MYNAME=rasheed_is+persistent
- Ctrl S, then Ctril X
- source .bashrc => this runs it manually .bashrc runs automatically
- printenv MYNAME

Use Case: We can store our environment variables for database connection

If you change the home environment, variable and you do `cd ~`, it will take you to that new name.

ssh -i rasheed-admin-user@20.117.177.99

## MANAGING PROCESSES

- A program that has been laoded into the CPU
- A CPU runs one process at a time. Linux runs it very fast so it might seems it's running multiple
- 8 Core => means it can run 8 processes at a time
- `ps` => shows user processes
  - `PID` => Process ID.
  - `TTY` => Terminal that is currently running
  - `CMD` =. this is the command we are running
- `ps --help simple`
- `ps -A` => gives you simple info
- `ps aux` =. give you detail information
- `top` => it will show you some
- M => press this to sort by memory usage
- N => sort by process ID
- P => sort by CPU usage
- q => to quit

### Running processes in the backgroun

- sleep 3 => with the sleep process, you lose the ability to use your terminal for 3 seconds
- sleep 5000 & => the **&** makes it run in the background and you can still use your terminal
- ps
- jobs -l => this shows the processes that you created
- sleep 3000 & => this starts a second process in the background

### STOPPING PROCESSES

- kill -l ID_of_the_process => this is a gentle kill
- kill -l 21234 => 21234 is the process ID
- jobs -l => it puts it in hangup and then you don't see it again
- kill -15 21232 => this is a bit more forceful
- jobs -l => you should see the process in terminated
- sleep 5000 &
- ps => to see the process ID
- kill -9 process_ID => this is a brute force kill
- jobs -l => you should see the process killed
- Use kill -1 or kill -15 first.
