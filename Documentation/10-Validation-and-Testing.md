# Validation and Testing

## Objective

The purpose of this stage was to validate the complete security workflow that I had built throughout the project.

Rather than assuming that the detection script, Cron automation, and firewall response were working correctly, I performed additional tests to confirm the behaviour of each component.

The validation followed the same process used throughout the project:

**Generate Activity → Detect → Investigate → Contain → Validate**

---

## Detection Validation

I first verified that the Ubuntu server was still recording SSH authentication activity.

I checked the authentication log using:

sudo grep -Ei "Failed password|Invalid user" /var/log/auth.log | tail -10

This allowed me to confirm that SSH authentication events were still being recorded.

I then checked the detection output:

cat ~/security_alarts.log

The alert log was reviewed to confirm that the detection script was identifying the relevant SSH events.

Cron Validation

I verified that the scheduled detection task was still present using:

crontab -l

The scheduled task was displayed:

*/1 * * * * /home/ola/ssh_alart.sh

This confirmed that the detection script remained registered with Cron.

I then allowed the scheduled task to execute and checked the alert log again.

This provided evidence that the detection process could run automatically without manually starting the script.

Firewall Validation

I checked the current UFW configuration using:

sudo ufw status numbered

This allowed me to verify the active firewall rules and confirm that the containment rule had been applied.

I specifically checked the rule associated with the Kali Linux source address:

192.168.10.101

The firewall configuration was compared with the expected response to make sure the rule was targeting the intended source and SSH service.

SSH Connectivity Testing

From Kali Linux, I tested the SSH connection to the Ubuntu server:

ssh ola@192.168.10.100

The result was compared before and after the firewall containment rule was applied.

Before containment, SSH communication was available because the Kali system was permitted to reach the SSH service.

After the containment rule was applied, the connection behaviour changed according to the active UFW configuration.

This provided a practical way to determine whether the firewall response was actually affecting the intended traffic.

Port Validation

I also used Nmap from Kali Linux to examine the SSH service:

nmap -p 22 192.168.10.100

This allowed me to compare the visibility of the SSH service during the testing process.

The Nmap result was interpreted together with the UFW configuration rather than being treated as the only source of evidence.

This was important because a port being filtered does not necessarily mean that the SSH service itself has been stopped. It can indicate that a firewall is preventing normal access.

Final Validation

The main components of the project were validated individually:

Component	Validation Method	Result
Network	IP configuration and connectivity	Verified
SSH	Service status and connection test	Verified
UFW	ufw status numbered	Verified
Log Detection	Authentication log search	Verified
Detection Script	Script execution and alert log	Verified
Cron	crontab -l	Verified
Containment	Firewall rule and SSH test	Verified
Network Response	Nmap port scan	Verified

These tests provided evidence that the individual components worked together as intended within the laboratory environment.

Outcome

The validation stage confirmed the main workflow of the project.

The process could be summarized as:

SSH Activity
     ↓
Authentication Log
     ↓
Detection Script
     ↓
Cron Automation
     ↓
IOC Identification
     ↓
UFW Containment
     ↓
Nmap / SSH Validation

The project therefore moved beyond simply configuring security tools and demonstrated how the different components could be connected into a basic detection and response workflow.

Reflection

The validation stage was particularly important because it showed me that implementing a security control is only the beginning.

A firewall rule can exist without producing the expected result. A detection script can execute without detecting the intended event. A Cron job can exist without successfully running the required command.

For that reason, I learned to verify each stage independently and then test the complete workflow.

This approach is similar to how security operations work in practice: an analyst should be able to demonstrate what happened, what control was applied, and whether the response actually produced the expected result.

The laboratory also helped me understand the difference between configuration and validation. Configuration creates the control, while testing provides evidence that the control is working.

Screenshots

The following screenshots support this stage:https://github.com/SheuSec/ssh-threat-detection-firewall-response/blob/main/Screenshots/Validation-and-Testing.pdf
