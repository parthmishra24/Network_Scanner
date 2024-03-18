# Network_Scanner

# Script: Network Scanner

This Bash script provides a user-friendly interface to perform various network scans and operations. It includes functionalities to conduct port scans using `masscan`, `nmap`, and `netexec`.

## Features:

- **Port Scanning with Masscan**: Scan for open ports on a specified IP address or range using Masscan.
- **Comprehensive Nmap Scans**: Conduct detailed scans including service version detection, OS detection, and aggressive scanning using Nmap.
- **Netexec Module Scans**: Execute specific network services checks using Netexec, supporting modules such as FTP, SSH, SMB, WMI, VNC, WinRM, LDAP, RDP, and MSSQL.

## Usage:

1. Clone the repository or download the script.
2. Ensure you have necessary permissions to execute the script (`chmod +x network_scanner.sh`).
3. Run the script: `./network_scanner.sh`.
4. Follow the on-screen instructions to select the desired scan options and provide IP addresses or ranges when prompted.

## Prerequisites:

- `masscan`: Ensure Masscan is installed on your system. You may need superuser privileges (`sudo`) to run it.
- `nmap`: Nmap should be installed on your system.
- `netexec`: Make sure Netexec is installed. It's a separate tool for executing network service checks.

## Installation:

Clone the repository:
```
git clone https://github.com/parthmishra24/Network_Scanner.git
```

## Usage Examples:

### Port Scan with Masscan:
```bash
$ ./network_scanner.sh

# Follow the prompts to initiate a Masscan port scan.
```

### Nmap Scan:
```bash
$ ./network_scanner.sh

# Follow the prompts to start an Nmap scan.
```

### Netexec Module Scan:
```bash
$ ./network_scanner.sh

# Follow the prompts to run a Netexec module scan.
```

## Contributions:

Contributions are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or create a pull request.

---
*Note: Remember to ensure that you have appropriate permissions and authorizations before conducting any network scans, as they may involve probing systems and networks, which could potentially lead to legal or security-related implications.*
