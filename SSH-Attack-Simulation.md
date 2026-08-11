# SSH Attack Simulation

## Objective

After completing the network, SSH, and firewall configuration, I moved to the testing phase of the project.

The objective was to generate a controlled SSH authentication event that could later be detected and investigated from the Ubuntu server.

I used Kali Linux as the testing machine and Ubuntu as the monitored server.

The test was deliberately performed in my isolated laboratory environment. Instead of attempting to gain unauthorized access, I used an invalid username to generate a failed authentication event that would leave evidence in the Ubuntu authentication logs.

---

## Implementation

I began from the Kali Linux machine and confirmed that the Ubuntu server was reachable.

The target Ubuntu server was:


192.168.10.100

The purpose of using wronguser was to generate a controlled authentication event without using a valid account on the Ubuntu server.

The SSH service responded to the connection attempt and reported that the user did not exist.

This confirmed that the request had reached the Ubuntu SSH service.

I did not continue attempting passwords or try to gain unauthorized access. The purpose of the activity was simply to create a detectable event for the monitoring and investigation stages of the project.

Verification

After generating the SSH event from Kali, I returned to the Ubuntu server to determine whether the activity had been recorded.

I checked the authentication log using:

sudo grep "Invalid user" /var/log/auth.log | tail -5

The log contained an entry associated with the test.

The event included information such as:

Invalid user wronguser from 192.168.10.101

This was important because it connected the failed authentication attempt to the Kali Linux testing machine.

I also searched for failed authentication events using:

sudo grep "Failed password" /var/log/auth.log | tail -5

This allowed me to review additional SSH authentication activity recorded by the server.

Evidence Collected

The controlled test provided several useful pieces of information:

Evidence	Value
Target Server	192.168.10.100
Source System	192.168.10.101
Service	SSH
Port	22
Username	wronguser
Event	Invalid SSH user

The information recorded by Ubuntu matched the activity generated from Kali.

Outcome

The controlled SSH authentication test was successfully generated and recorded by the Ubuntu server.

The event provided the evidence required for the next stage of the project, where I investigated the authentication logs and developed a simple detection mechanism.

At this point, the project had moved from infrastructure configuration into actual security monitoring and investigation.

Reflection

This test helped me understand an important part of security monitoring: an event generated on one system can become evidence on another system.

From the Kali side, I could see that the SSH connection had been rejected.

However, the Ubuntu authentication log provided much more useful information for an analyst, including the source IP address and the username involved in the event.

This showed me why centralized and well-maintained logs are important in a security environment. Without the server-side log, it would be much harder to investigate what had happened.

The controlled nature of the test also allowed me to understand the investigation process without interacting with systems outside my laboratory environment.

Screenshots

The following screenshots support this stage:
