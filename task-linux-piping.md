# Linux Piping

## What is piping?

Piping allows you to connect the output of one command directly to the input of another. This seamless flow of data enables you to chain multiple commands together, creating complex data processing pipelines.

## How is piping different to redirection using > or >>?

Redirection (> or >>) is used to send the output of a command to a file. Piping (|) is used to send the output of one command to the input of another command.

## What character is used for piping?

The pipe character (|) is used to represent piping in command-line interfaces.

## Give an example of a command that uses piping once

```bash
ls | wc -l
```

This command counts the number of files in the current directory. The `ls` command lists the files, and its output is piped to the `wc -l` command, which counts the lines in the input.

## Give an example of a command that uses piping twice

```bash
find /etc -name "*.conf" | grep "apache" | wc -l
```

This command counts the number of configuration files in the `/etc` directory that contain the word "apache". The `find` command locates the files, its output is piped to the `grep` command, which filters the files based on the pattern "apache", and the final output is piped to the `wc -l` command to count the lines.

## Give an example of a command that uses piping twice, then sends the output to a file

```bash
find /etc -name "*.conf" | grep "apache" | wc -l > apache_conf_count.txt
```

This command is similar to the previous example, but instead of displaying the count on the screen, it redirects the output to a file named apache_conf_count.txt.
