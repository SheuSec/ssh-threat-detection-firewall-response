# SSH Configuration

## Objective

After establishing network connectivity between the Ubuntu server and Kali Linux, the next stage was to configure the **Secure Shell (SSH)** service on Ubuntu.

SSH was important to this project because it provided the network service through which I could generate controlled authentication activity and later investigate the resulting security events.

The objective was to make sure that SSH was installed, running correctly, listening on the expected port, and accessible from the Kali testing machine.

---

## Implementation

I first checked whether the SSH service was available on the Ubuntu server.

I used:


sudo systemctl status ssh
This allowed me to determine whether the SSH service was already installed and running.

Where necessary, I installed the OpenSSH server package using:
sudo apt install openssh-server

After confirming the installation, I checked the service again:

sudo systemctl status ssh

The SSH service was running successfully.

I then confirmed that the server was listening for SSH connections on the standard TCP port:

22

I also checked the listening ports on Ubuntu using:

sudo ss -tulpn | grep :22

This allowed me to verify that the SSH daemon was actively listening for incoming connections.

SSH Configuration

The main SSH service configuration file is:

/etc/ssh/sshd_config

I used this configuration file to understand the settings controlling the SSH service.

For this laboratory, I kept the configuration simple because the main purpose was to monitor and investigate SSH authentication activity rather than make extensive changes to the SSH daemon.

The standard SSH port remained:

22

This also made it easier to identify SSH traffic during network and log analysis.

Verification

After configuring the service, I verified that SSH was operating correctly.

I confirmed that:

The OpenSSH server was installed.
The SSH service was running.
The SSH daemon was listening on TCP port 22.
The Ubuntu server had a valid IP address.
The Kali testing machine could communicate with the Ubuntu server.

From Kali Linux, I tested the SSH connection using:

ssh ola@192.168.10.100

The connection test confirmed that the SSH service was reachable from the testing machine.

This established the basic SSH communication required for the later security testing stages.

Outcome

The Ubuntu server was successfully configured with a functioning SSH service.

The service was listening on TCP port 22, and the Kali Linux testing machine was able to reach the server through SSH.

This provided the network service required for the next stage of the project, where I generated a controlled authentication event and investigated how Ubuntu recorded it.

Reflection

Configuring SSH gave me a better understanding of how a simple network service can become an important source of security information.

An SSH connection is not just a method of remotely accessing a Linux system. Every authentication attempt can also generate useful security evidence.

This became particularly important later in the project when I investigated failed authentication attempts in /var/log/auth.log.

By first understanding how the SSH service was configured and where it was listening, I had a clearer baseline against which I could investigate unusual activity.

Screenshots

The following screenshots support this stage:
