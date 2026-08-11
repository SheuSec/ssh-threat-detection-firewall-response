# SSH Threat Detection & Firewall Response Lab

## Overview

This project documents a practical cybersecurity laboratory I built to understand how suspicious SSH authentication activity can be detected, investigated, and contained on a Linux server.

The lab uses **Ubuntu Linux** as the monitored server and **Kali Linux** as the security testing machine.

I simulated a controlled SSH authentication attempt using an invalid username, investigated the resulting authentication logs, identified the source IP address, created a Bash-based detection script, automated the detection process with Cron, and used the UFW firewall to demonstrate containment.

The project follows a basic SOC investigation workflow:

**Detect → Investigate → Identify → Contain → Validate**

---

## Lab Environment

| System | IP Address | Role |
|---|---|---|
| Ubuntu Linux | `192.168.10.100` | Monitored Server |
| Kali Linux | `192.168.10.101` | Security Testing |

### Technologies Used

- Ubuntu Linux
- Kali Linux
- OpenSSH
- UFW Firewall
- Bash
- Cron
- Nmap
- Linux Authentication Logs

---

## Project Workflow

```text
Network Configuration
        ↓
SSH Configuration
        ↓
Firewall Configuration
        ↓
Controlled SSH Authentication Test
        ↓
Log Investigation
        ↓
Detection Script
        ↓
Automated Detection
        ↓
Source Identification
        ↓
Firewall Response
        ↓
Validation


Project Objectives

The main objectives of this project were to:

Configure a Linux server for SSH monitoring.
Generate a controlled SSH authentication event.
Investigate SSH activity using Linux authentication logs.
Identify the source IP associated with the event.
Develop a simple Bash detection script.
Automate the detection process using Cron.
Use UFW for firewall-based containment.
Validate the security response using Nmap.
Document the investigation and lessons learned.
Documentation

The detailed implementation of each stage is documented separately:

Network Configuration
SSH Configuration
Firewall Configuration
SSH Attack Simulation
SSH Log Investigation
SSH Detection Script
Cron Automation
IOC Investigation
Firewall Containment
Validation and Testing
Challenges and Troubleshooting
Conclusion
Key Result

The laboratory demonstrated how a suspicious SSH authentication event can move through a basic security monitoring workflow:

Authentication Event → Log Evidence → Detection → Investigation → Containment → Validation

The project also helped me understand the importance of validating a security response rather than simply assuming that a firewall rule or detection mechanism has worked.

Disclaimer

This project was performed in a controlled laboratory environment for cybersecurity education and portfolio development. All security testing was conducted against systems within the laboratory environment.
