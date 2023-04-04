# Auto-Scan

# Note:warning:: This project is licensed under the terms of the MIT license.

# Info:

This [auto-scan.sh](https://github.com/JimSolomon/Auto-Scan/blob/main/auto-scan.sh) will auto emuerate targets and its SSL, ports, user-agents, directories, sub-domains infomation. It combined tools
such as [threader3000](https://github.com/JimSolomon/bug-bounty-2023/blob/main/thread3000.py), [nikto](https://github.com/sullo/nikto),  [feroxbuster](https://github.com/epi052/feroxbuster), [ffuf](https://github.com/ffuf/ffuf), `crt.sh`, and [FinalRecon](https://github.com/thewhiteh4t/FinalRecon). It also can scan mutilple IPs with different mode. The script was inspired by the book of [bug-bounty-bootcamp](https://nostarch.com/bug-bounty-bootcamp).

Usage: `-m` to specify which scan mode before the domains
Aruguments (lower case): -m :  `thread`, `dir`, `crt` , `nikto`. `sub`, `final`, `who` and `all` (scan all the modes) 

```bash
./auto-scan.sh -m crt twitter.com  smile.amazon.co.uk
```

# Tools Installation for Ubuntu

```bash

sudo apt install seclists curl feroxbuster nikto nmap finalrecon whois dig 

```

```bash
git clone https://github.com/ffuf/ffuf ; cd ffuf ; go get ; go build

```

# Demo
![-h](https://github.com/JimSolomon/Auto-Scan/blob/main/auto-scan.png)
# Run `whois` command
![scan](https://github.com/JimSolomon/Auto-Scan/blob/main/scan.png)
# Run `dig` and `threader3000`
![dig and threader3000](https://github.com/JimSolomon/Auto-Scan/blob/main/dig%20and%20threader3000.png)

