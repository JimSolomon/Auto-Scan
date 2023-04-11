# Auto-Scan

                        █████╗ ██╗   ██╗████████╗ ██████╗     ███████╗ ██████╗ █████╗ ███╗   ██╗    
                       ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗    ██╔════╝██╔════╝██╔══██╗████╗  ██║    
                       ███████║██║   ██║   ██║   ██║   ██║    ███████╗██║     ███████║██╔██╗ ██║    
                       ██╔══██║██║   ██║   ██║   ██║   ██║    ╚════██║██║     ██╔══██║██║╚██╗██║    
                       ██║  ██║╚██████╔╝   ██║   ╚██████╔╝    ███████║╚██████╗██║  ██║██║ ╚████║  
                                        --------- A project by Jim Solomon ---------


# Note:warning:: This project is licensed under the terms of the MIT license.

# INFO:

This [auto-scan.sh](https://github.com/JimSolomon/Auto-Scan/blob/main/auto-scan.sh) will auto emuerate infomation of a target and it's SSL, ports, user-agents, directories, sub-domains and much more. Users can also tweak commands they want to run, they will need to define them in [nmap.lib](https://github.com/JimSolomon/Auto-Scan/blob/main/nmap.lib) and update the scan mode in [auto-scan.sh](https://github.com/JimSolomon/Auto-Scan/blob/main/auto-scan.sh).

This version combined tools of [threader3000](https://github.com/JimSolomon/bug-bounty-2023/blob/main/thread3000.py), [nikto](https://github.com/sullo/nikto),  [feroxbuster](https://github.com/epi052/feroxbuster), [ffuf](https://github.com/ffuf/ffuf), [crt.sh](https://crt.sh/), `whois`, `dig` and [FinalRecon](https://github.com/thewhiteh4t/FinalRecon). It also can scan mutilple IPs with different mode. The script was also inspired by the book of [bug-bounty-bootcamp](https://nostarch.com/bug-bounty-bootcamp).

# Tool Installation for Ubuntu&Kali

```bash

sudo apt install jq seclists curl feroxbuster nikto nmap finalrecon whois dig && git clone https://github.com/ffuf/ffuf ; cd ffuf ; go get ; go build

```
# Usage:
Aruguments `-m` (lower case) to specify which scan mode before the domains. 
Available modes are: `thread`(threader3000), `dir`(feroxbuster), `crt`(crt.sh), `nikto`, `sub`(ffuf scanning sub-domains), `final` (Run FinalRecon), `who`(whois) and `all` (scan all the modes) 

Example:
```bash
./auto-scan.sh -m crt twitter.com smile.amazon.co.uk
```
# DEMO
1. `-h` (Help) details 
![-h](https://github.com/JimSolomon/Auto-Scan/blob/main/banner.png)
2. [crt.sh](https://crt.sh/)
![dig and threader3000](https://github.com/JimSolomon/Auto-Scan/blob/main/crt2.png)
3. `whois` scan 
![scan](https://github.com/JimSolomon/Auto-Scan/blob/main/whois.png)

4. [FinalRecon](https://github.com/thewhiteh4t/FinalRecon) 
![FinalRecon](https://github.com/JimSolomon/Auto-Scan/blob/main/final.png)

5. [threader3000](https://github.com/JimSolomon/bug-bounty-2023/blob/main/thread3000.py)
![threader](https://github.com/JimSolomon/Auto-Scan/blob/main/threader.png)

