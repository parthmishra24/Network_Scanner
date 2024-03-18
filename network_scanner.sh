#!/bin/bash

# Function to validate IP address
validate_ip() {
    local ip=$1
    if [[ $ip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to validate IP range
validate_ip_range() {
    local ip_range=$1
    if [[ $ip_range =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/[0-9]+$ ]]; then
        return 0
    else
        return 1
    fi
}

# Function to confirm action
confirm_action() {
    local action=$1
    read -p "Do you want to proceed with $action? (Y/N): " choice
    case "$choice" in 
        y|Y ) return 0 ;;
        n|N ) return 1 ;;
        * ) echo "Invalid choice. Please enter Y or N."; confirm_action "$action";;
    esac
}

# Function to display usage information
usage() {
    cat <<EOF
Usage: $(basename "$0")

Description:
  This script allows you to perform various scans and operations.

Options:
  No options are required, just follow the instructions.

EOF
}

# Display usage
usage

# Perform port scan using masscan
scan_with_masscan() {
    read -p "Do you want to run Masscan? (Y/N): " run_masscan_choice
    if [[ $run_masscan_choice =~ ^[Yy]$ ]]; then
        local ip_or_range
        read -p "Enter IP address or range for Masscan: " ip_or_range
        if validate_ip "$ip_or_range" || validate_ip_range "$ip_or_range"; then
            echo "Scanning ports for $ip_or_range ..."
            sudo masscan -p20,21-23,25,53,80,110,111,135,139,143,443,445,993,995,1723,3306,3389,5900,8080 "$ip_or_range"
            echo "-----------------------"
            echo "Masscan completed."
            echo "-----------------------"
            echo
        else
            echo "Invalid IP address or range for Masscan!"
        fi
    fi
}

# Perform nmap scan
scan_with_nmap() {
    read -p "Do you want to run Nmap? (Y/N): " run_nmap_choice
    if [[ $run_nmap_choice =~ ^[Yy]$ ]]; then
        local ip_or_range
        read -p "Enter IP address or range for Nmap: " ip_or_range
        if validate_ip "$ip_or_range" || validate_ip_range "$ip_or_range"; then
            echo "Starting nmap scan for $ip_or_range ..."
            nmap -sV -A -O -v "$ip_or_range" -oN "nmap_$ip_or_range.txt"
        else
            echo "Invalid IP address or range for Nmap!"
        fi
    fi
}

# Perform netexec scan
scan_with_netexec() {
    read -p "Do you want to run Netexec? (Y/N): " run_netexec_choice
    if [[ $run_netexec_choice =~ ^[Yy]$ ]]; then
        local ip_or_range
        read -p "Enter IP address or range for Netexec: " ip_or_range
        if validate_ip "$ip_or_range" || validate_ip_range "$ip_or_range"; then
            echo "Available netexec modules: ftp, ssh, smb, wmi, vnc, winrm, ldap, rdp, mssql"
            local module
            read -p "Select a module to run (default: smb): " module
            module=${module:-smb}
            echo "Starting netexec $module scan for $ip_or_range ..."
            netexec "$module" "$ip_or_range"
        else
            echo "Invalid IP address or range for Netexec!"
        fi
    fi
}

# Perform scans
scan_with_masscan
scan_with_nmap
scan_with_netexec

