# Firewall Configuration

## Objective

After confirming that SSH was working correctly, the next stage was to configure the Ubuntu host-based firewall.

I used **UFW (Uncomplicated Firewall)** because it provides a straightforward way to manage incoming and outgoing network connections on Ubuntu.

The objective was to establish a basic firewall baseline before generating the SSH security event. I also wanted the firewall configuration to support the later containment stage of the project.

---

## Implementation

I first checked the current firewall status using:


sudo ufw status verbose

This allowed me to determine whether UFW was active and review its current rules and default policies.

The firewall was configured with a restrictive inbound policy while allowing outbound traffic.

Because Kali Linux was being used as my controlled testing machine, I needed to ensure that it could reach the SSH service on Ubuntu.

I therefore created an SSH rule allowing the Kali testing machine to access TCP port 22:

sudo ufw allow from 192.168.10.101 to any port 22 proto tcp

This rule specifically allowed SSH traffic from the Kali IP address rather than opening the SSH service to every device on the network.

I then checked the firewall rules using:

sudo ufw status numbered

This allowed me to verify that the SSH rule had been added successfully.

Firewall Baseline

The basic firewall configuration established during this stage was:

Ubuntu Server
192.168.10.100
       │
       │ TCP/22
       │
       ▼
Kali Linux
192.168.10.101

The purpose of this configuration was to maintain controlled SSH access while still allowing the security testing required for the project.

Verification

I verified the firewall configuration by checking:

sudo ufw status verbose

and:

sudo ufw status numbered

I confirmed that UFW was active and that the SSH rule for the Kali testing machine was present.

I also confirmed that SSH communication between Kali and Ubuntu was still possible after applying the firewall configuration.

This was important because I wanted to establish a known working state before beginning the controlled attack simulation.

Outcome

The Ubuntu firewall was successfully configured and the SSH service remained accessible from the Kali testing machine.

The firewall now provided the control mechanism that I would later use during the response stage.

This meant that after identifying the source of suspicious SSH activity, I could apply a firewall rule to restrict or block that source.

Reflection

This stage showed me that firewall configuration is not simply about blocking everything.

A useful firewall configuration needs to distinguish between traffic that is required and traffic that should be restricted.

In this laboratory, I allowed SSH from my known Kali testing machine because that traffic was part of the experiment.

This also created a useful baseline for the later response stage. Once suspicious activity was identified, I could compare the original firewall configuration with the response configuration and observe how the security control changed.

Another important lesson was that firewall rules need to be checked carefully. The presence of a rule does not always guarantee the expected result, especially when multiple rules can affect the same traffic.

Screenshots

The following screenshots support this stage:
