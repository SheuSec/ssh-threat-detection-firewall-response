# SSH Threat Detection & Firewall Response Lab

## Overview

This project is a hands-on cybersecurity laboratory where I built and tested a small Linux-based security monitoring and response workflow.

The main goal was to understand what happens when suspicious SSH authentication activity occurs, how that activity is recorded in system logs, how it can be detected automatically, and how a firewall can be used as part of the response.

I used **Ubuntu Server** as the monitored system and **Kali Linux** as the security testing machine.

Rather than focusing only on individual commands, I approached the project as a small SOC investigation:

**Generate Activity → Detect → Investigate → Identify → Contain → Validate**

---

## Lab Environment

| Component | Role |
|---|---|
| Ubuntu Server | Monitored server |
| Kali Linux | Security testing machine |
| OpenSSH | Remote access service |
| UFW | Host-based firewall |
| Bash | Detection automation |
| Cron | Scheduled detection |
| Nmap | Network validation |
| `/var/log/auth.log` | Authentication evidence |
| MITRE ATT&CK | Threat behaviour mapping |

### Network

Kali Linux
192.168.10.101
       |
       | SSH / TCP 22
       |
       v
Ubuntu Server
192.168.10.100
Project Objective

The project was designed to demonstrate a complete security monitoring workflow around SSH authentication activity.

The objectives were to:

Configure and verify SSH access.
Configure UFW firewall controls.
Generate a controlled SSH authentication event.
Investigate the resulting authentication logs.
Identify useful indicators from the event.
Create a Bash-based detection script.
Automate the detection process using Cron.
Demonstrate firewall-based containment.
Validate the response using SSH and Nmap.
Map relevant activity to the MITRE ATT&CK framework.
Security Workflow

The project followed this workflow:

                    SSH Activity
                         |
                         v
                Authentication Log
                         |
                         v
                  Detection Script
                         |
                         v
                  Cron Automation
                         |
                         v
                   IOC Investigation
                         |
                         v
                  Firewall Containment
                         |
                         v
                      Validation

This allowed me to move through the same general stages I would expect to see during a basic security investigation:

Detection → Investigation → Response → Validation

Project Implementation

01 — Network Configuration

I first established communication between the Ubuntu server and Kali Linux testing machine.

The configured addresses were:

Ubuntu Server: 192.168.10.100
Kali Linux:   192.168.10.101

This provided the network foundation required for the SSH and security testing stages.

Read Network Configuration



02 — SSH Configuration

I configured and verified the OpenSSH service on Ubuntu.

SSH was used as the remote service for the controlled authentication testing performed later in the project.

Read SSH Configuration



03 — Firewall Configuration

I configured UFW to control access to the Ubuntu server.

The firewall configuration was later used during the containment stage of the investigation.

Read Firewall Configuration



04 — SSH Attack Simulation

I generated a controlled SSH authentication event from Kali Linux using an invalid username.

The purpose was to create a detectable event within my isolated laboratory environment.

I did not perform a sustained brute-force attack. The event was deliberately controlled so that I could investigate how Ubuntu recorded the activity.

Read SSH Attack Simulation



05 — SSH Log Investigation

After generating the event, I investigated the Ubuntu authentication logs.

The main evidence source was:

/var/log/auth.log

I used Linux commands such as grep and tail to filter SSH-related authentication events and identify the source IP and username involved.

Read SSH Log Investigation



06 — SSH Detection Script

After manually investigating the logs, I created a Bash script to search for relevant SSH authentication events.

The script looks for indicators such as:

Failed password
Invalid user

The actual script is available here:

View Detection Script

The documentation for the detection stage is available here:

Read SSH Detection Documentation



07 — Cron Automation

I used Cron to schedule the detection script so that the monitoring process could run automatically.

For the laboratory, the script was scheduled to execute every minute.

This demonstrated how a manual log-searching process could be converted into basic automated monitoring.

Read Cron Automation



08 — IOC Investigation

I extracted useful indicators from the SSH event, including:

Source IP: 192.168.10.101
Username:  wronguser
Service:   SSH
Port:      22

The investigation also demonstrated why an indicator should be interpreted within the context of the environment rather than automatically being classified as malicious.

Read IOC Investigation



09 — Firewall Containment

After identifying the source involved in the controlled event, I demonstrated how UFW could be used to restrict SSH access from the identified source.

The containment stage was followed by validation to determine whether the firewall response produced the expected behaviour.

Read Firewall Containment



10 — Validation & Testing

I validated the different components of the project rather than assuming that the configuration was working.

Testing included:

Authentication log verification.
Detection script testing.
Cron verification.
UFW rule verification.
SSH connectivity testing.
Nmap port validation.

Read Validation & Testing



11 — Challenges & Troubleshooting

The project involved troubleshooting network connectivity, UFW rules, authentication logs, Cron configuration, detection logic, and firewall behaviour.

I documented the problems encountered and the approach I used to investigate and resolve them.

Read Challenges & Troubleshooting



12 — Conclusion

The final stage brings together the different components of the project and reflects on what I learned from building the laboratory.

Read Project Conclusion

MITRE ATT&CK Mapping

The project is mapped to relevant MITRE ATT&CK techniques where appropriate.

ATT&CK ID	Technique	Project Relevance
T1021.004	Remote Services: SSH	SSH was the remote service configured and tested in the laboratory.
T1110	Brute Force	The detection logic monitors SSH authentication failures and invalid-user events.
Important Context

The project generated a controlled invalid-user authentication event. It did not perform a sustained brute-force attack.

Therefore, the T1110 mapping is used to provide context for the authentication-failure detection logic rather than claiming that a complete brute-force attack was simulated.

Read Full MITRE ATT&CK Mapping

Tools & Technologies
Operating Systems
Ubuntu Server
Kali Linux
Security & Networking
OpenSSH
UFW
Nmap
Linux & Automation
Bash
Cron
grep
tail
cat
chmod
Framework
MITRE ATT&CK
Key Skills Demonstrated

Through this project, I demonstrated practical experience with:

Linux administration
SSH configuration
Firewall configuration
Authentication log analysis
Security event investigation
IOC identification
Bash scripting
Basic security automation
Cron scheduling
Network validation
Firewall-based containment
Security documentation
MITRE ATT&CK mapping
Troubleshooting


Repository Structure
SSH-Threat-Detection-Firewall-Response/
│
├── README.md
│
├── Documentation/
│   ├── 01-Network-Configuration.md
│   ├── 02-SSH-Configuration.md
│   ├── 03-Firewall-Configuration.md
│   ├── 04-SSH-Attack-Simulation.md
│   ├── 05-SSH-Log-Investigation.md
│   ├── 06-SSH-Detection-Script.md
│   ├── 07-Cron-Automation.md
│   ├── 08-IOC-Investigation.md
│   ├── 09-Firewall-Containment.md
│   ├── 10-Validation-and-Testing.md
│   ├── 11-Challenges-and-Troubleshooting.md
│   ├── 12-Conclusion.md
│   └── 13-MITRE-ATT&CK-Mapping.md
│
└── Scripts/
    └── ssh_alart.sh

    
Final Reflection

This project helped me understand that security monitoring is not simply about running a tool and looking at the output.

I had to build the environment, generate an event, collect evidence, investigate the event, identify useful indicators, create a detection method, automate the process, apply a response, and finally validate whether the response worked.

The most important lesson for me was learning to connect these stages together.

A single SSH authentication event became an opportunity to practice:

Detection → Investigation → Analysis → Response → Validation

This project also gave me a better understanding of how basic Linux administration skills can support security operations and how threat frameworks such as MITRE ATT&CK can provide additional context when documenting security activity.

Project Status

Completed

This laboratory demonstrates a controlled SSH detection, investigation, automation, and firewall response workflow using Ubuntu Server and Kali Linux.
