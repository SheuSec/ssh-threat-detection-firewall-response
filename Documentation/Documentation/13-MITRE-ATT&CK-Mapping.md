# MITRE ATT&CK Mapping

## Objective

To provide a security framework context for the SSH activity investigated in this laboratory, I mapped the relevant parts of the project to the MITRE ATT&CK framework.

I focused only on techniques that are directly relevant to the activity performed in the lab. Defensive activities such as log analysis, IOC investigation, firewall containment, and Cron automation were not incorrectly classified as adversary techniques.

---

## ATT&CK Technique Mapping

| ATT&CK ID | Technique | Project Application |
|---|---|---|
| T1021.004 | Remote Services: SSH | SSH was configured on the Ubuntu server and used as the remote service tested from Kali Linux. |
| T1110 | Brute Force | The project monitors SSH authentication failures and invalid-user events. The laboratory generated a controlled authentication failure rather than performing a sustained brute-force attack. |

---

## T1021.004 — Remote Services: SSH

**MITRE ATT&CK Technique:** T1021.004

**Technique:** Remote Services: SSH

SSH was one of the primary services used during this project.

The Ubuntu server provided the SSH service, while Kali Linux was used as the testing machine.

The laboratory configuration was:

Ubuntu Server
192.168.10.100
      │
      │ SSH
      │ Port 22
      ▼
Kali Linux
192.168.10.101

The SSH service provided the remote communication channel used during the controlled authentication test.

The project then monitored the resulting authentication activity through the Ubuntu authentication logs.

T1110 — Brute Force

MITRE ATT&CK Technique: T1110

Technique: Brute Force

The project includes detection of SSH authentication failures using the Ubuntu authentication log.

The detection script searches for events containing:

Failed password
Invalid user

The relevant command used in the investigation was:

sudo grep -Ei "Failed password|Invalid user" /var/log/auth.log

It is important to clarify that this laboratory did not perform a sustained brute-force attack.

Instead, I generated a controlled invalid-user authentication event to demonstrate how authentication failures can be recorded and detected.

The T1110 mapping therefore provides context for the detection logic rather than claiming that a complete brute-force attack was performed.

Detection and Response Activities

Several defensive activities were performed during the project.

These activities support the ATT&CK-informed investigation but are not themselves being classified as adversary techniques.

Log Investigation

I examined:

/var/log/auth.log

to identify SSH authentication events.

Detection

A Bash script was created to search for:

Failed password
Invalid user

events.

Automation

Cron was used to execute the detection script automatically.

IOC Investigation

The investigation extracted information including:

Source IP
Username
Service
Port
Event Type
Containment

UFW was used to restrict SSH traffic from the identified source IP during the controlled laboratory test.

Validation

SSH connectivity and Nmap were used to validate the resulting firewall behaviour.

Attack-to-Detection Workflow

The relationship between the ATT&CK context and the defensive workflow can be represented as:

SSH Remote Service
T1021.004
       │
       ▼
Authentication Activity
       │
       ▼
Ubuntu Authentication Logs
       │
       ▼
Detection Script
       │
       ▼
IOC Investigation
       │
       ▼
Firewall Containment
       │
       ▼
Validation
Why the Mapping Matters

Mapping the project to MITRE ATT&CK helped me understand how individual security events can be connected to a broader threat-informed framework.

Rather than simply documenting that an SSH connection occurred, I could place the activity within the context of remote services and authentication-related attack behaviour.

The mapping also helped me understand the difference between:

An adversary technique.
A detection method.
An investigation activity.
A defensive response.

This distinction is important when documenting SOC investigations because not every security operation should be labelled as an ATT&CK technique.

Reflection

The MITRE ATT&CK mapping added another layer to the project.

It allowed me to move beyond simply configuring SSH, analysing logs, and creating firewall rules and instead consider how the observed behaviour relates to a recognised threat framework.

The exercise also reinforced the importance of accurate classification.

I intentionally avoided claiming that a single invalid SSH login represented a complete brute-force attack. Instead, I used the authentication failure as a controlled event for demonstrating detection.

This approach makes the project more technically accurate and better reflects how ATT&CK can be used to support real-world security analysis.

References
MITRE ATT&CK — T1021.004: Remote Services: SSH
MITRE ATT&CK — T1110: Brute Force
