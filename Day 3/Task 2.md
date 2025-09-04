# DNS Mapping to IP using `/etc/hosts`

## TASK DESCRIPTION

There is a website running at `13.222.131.35` over port 80. The application (imaginary) in your system connects to it with a DNS name, not its IP address. Configure your compute instance to successfully resolve the DNS name (choose a DNS name of your own). Before that, check whether the server exists by pinging it. Check whether your compute instance is able to resolve the DNS name.

- **Given IP:** `13.222.131.35`
- **Chosen DNS name:** `shamlin.devops`

---

## Step 1: Check if the server exists using `ping`

```bash
ping -c 3 13.222.131.35
```
## Opening and editing in /etc/hosts
```bash
sudo vim /etc/hosts
```
and then added 
```bash
13.222.131.35 shamlin.devops
```

## Testing
```bash
ping shamlin.devops
```
## Output
```bash
PING shamlin.devops (13.222.131.35) 56(84) bytes of data.
```
