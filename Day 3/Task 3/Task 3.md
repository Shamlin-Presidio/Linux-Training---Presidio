# Zipping Files

## TASK DESCRIPTION

Your audit team requires you to provide the log files in your system. Compress the folder
/var/log/ as a tar ball and store it to /var/. Copy it to anyone of your friends' machine with scp
and share the screenshot of it in your assignment.


## Step 1: Compressing files with `tar`:

` tar -czvf logs.tar.gz logs `

## Step 2: Sending to VM:

` scp -i Yogesh_J_S_2.pem -P 27243 logs.tar.gz ubuntu@75.101.200.200:/home/ubuntu/ `

