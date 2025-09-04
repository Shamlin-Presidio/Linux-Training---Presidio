# Firewall Management

## TASK DESCRIPTION:

You have previously configured SSH to allow connections only in port 27243. Use your system’s
firewall to block any incoming connections on port 22 and allow incoming connection on port
27243 only from your computer.

## STEP 1: Get IP Address of my local machine

` ipconfig getifaddr en0 `

## Step 2: Firewall setting:
` sudo ufw status `
- Got: ` Status: inactive `

`sudo ufw status`

- Got:
```
Status: active

To                         Action      From
--                         ------      ----
27243/tcp                  ALLOW       Anywhere                  
27243/tcp (v6)             ALLOW       Anywhere (v6)  
```

## Step 3: Allow to port 27243 :
`sudo ufw allow from 192.168.1.5 to any port 27243 proto tcp` 

## Step 4: Deny port 22 :
`sudo ufw deny 22/tcp
sudo ufw enable`

## Step 5: Verify:
`sudo ufw status'
- Got:
```
Status: active

To                         Action      From
--                         ------      ----
27243/tcp                  ALLOW       Anywhere                  
27243/tcp                  ALLOW       192.168.1.5               
22/tcp                     DENY        Anywhere                  
27243/tcp (v6)             ALLOW       Anywhere (v6)             
22/tcp (v6)                DENY        Anywhere (v6)
```


## Undo port changes for safety:
```
sudo ufw delete allow from 192.168.1.5 to any port 27243 proto tcp
sudo ufw allow 22/tcp
sudo ufw enable
sudo ufw status verbose
sudo ufw disable
```
