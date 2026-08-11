# Conclusion

## Project Summary

This project was developed as a practical laboratory exercise to understand the basic process of detecting and responding to suspicious SSH authentication activity on a Linux server.

I built the environment using Ubuntu Linux as the monitored server and Kali Linux as the security testing machine.

The project started with basic network configuration and gradually developed into a simple security monitoring and response workflow.

The main process followed was:


Network Configuration
        ↓
SSH Configuration
        ↓
Firewall Configuration
        ↓
Controlled SSH Activity
        ↓
Log Investigation
        ↓
Detection
        ↓
Automation
        ↓
IOC Investigation
        ↓
Firewall Containment
        ↓
Validation

What I Implemented

During the project, I configured and tested several components.

Network Configuration

I established communication between the Ubuntu server and Kali Linux testing machine.

The systems used:

Ubuntu: 192.168.10.100

Kali:   192.168.10.101

This provided the foundation for the remaining stages.

SSH Service

I configured and verified the OpenSSH service on Ubuntu.

SSH provided the service through which I generated controlled authentication events.

UFW Firewall

I configured UFW to control SSH access to the Ubuntu server.

The firewall was also used later to demonstrate containment of an identified source.

Log Investigation

I investigated SSH authentication activity using:

/var/log/auth.log

I used Linux commands such as grep and tail to filter relevant events.

Detection Script

I created a Bash script capable of searching for indicators such as:

Failed password
Invalid user

The script provided a basic automated detection mechanism.

Cron Automation

I used Cron to schedule the detection script so that it could execute automatically.

This moved the project from manual detection toward basic automated monitoring.

IOC Investigation

I extracted useful information from the SSH events, including:

Source IP
Username
Service
Port
Event Type

This allowed me to build context around the observed activity.

Firewall Containment

I demonstrated how the identified source could be restricted using UFW.

The response was then validated through additional testing.

Security Workflow

The project demonstrated a simplified SOC-style workflow:

DETECT
  ↓
Identify suspicious SSH activity

INVESTIGATE
  ↓
Review authentication logs

IDENTIFY
  ↓
Determine source IP and event details

CONTAIN
  ↓
Apply firewall restriction

VALIDATE
  ↓
Test whether the response worked

This workflow helped me understand that cybersecurity is not simply about running security tools.

The important part is connecting the evidence from one stage to the next and making decisions based on what the evidence shows.

Key Lessons Learned

One of the biggest lessons I learned from this project was the importance of visibility.

Without authentication logs, the SSH event would have been much harder to investigate.

I also learned that detection needs context.

An IP address appearing in a log does not automatically mean that the address is malicious. It needs to be correlated with the environment and surrounding activity.

Another important lesson was the difference between configuration and validation.

Creating a firewall rule or Cron job is only part of the process. I also needed to test the configuration and confirm that it produced the expected result.

The project also improved my understanding of Linux command-line tools, particularly:

grep
tail
cat
chmod
crontab
ufw
ss
nmap

These commands provided practical ways to inspect, detect, configure, and validate different parts of the environment.

Challenges

The project was not completed without challenges.

I encountered issues involving network connectivity, firewall rules, Cron configuration, log filtering, and validation.

Working through these problems taught me to troubleshoot systematically instead of changing multiple configurations at the same time.

The troubleshooting process became:

Identify
   ↓
Investigate
   ↓
Change
   ↓
Test
   ↓
Verify
   ↓
Document

This approach helped me understand not only what worked, but also why it worked.

Final Outcome

At the end of the project, I had developed a small laboratory environment capable of demonstrating the following process:

SSH Event
    ↓
Authentication Log
    ↓
Detection Script
    ↓
Cron Automation
    ↓
IOC Identification
    ↓
Firewall Response
    ↓
Validation

Although this laboratory is much simpler than an enterprise SOC environment, it provided a practical foundation for understanding how security monitoring and response can be implemented using basic Linux tools.

Final Reflection

This project gave me an opportunity to approach a cybersecurity problem from beginning to end.

Instead of only studying individual commands, I was able to see how networking, Linux administration, logging, detection, automation, investigation, and firewall controls can work together.

The most valuable part for me was learning to think in terms of a complete investigation rather than a single tool.

A suspicious event is only the beginning.

The real work starts with asking:

What happened?

Where did it come from?

What evidence supports it?

What should be done about it?

Did the response actually work?

That mindset is something I want to continue developing as I build more cybersecurity projects and move toward real-world SOC and security operations work.

Project Status

Status: Completed

The laboratory successfully demonstrated a complete basic SSH threat detection and firewall response workflow in a controlled environment.
