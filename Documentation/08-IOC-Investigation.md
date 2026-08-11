# IOC Investigation

## Objective

After identifying the suspicious SSH authentication event, I moved to the indicator investigation stage.

The objective was to extract useful indicators from the authentication logs and determine what information could be used to identify and investigate the source of the activity.

For this investigation, I focused mainly on:

- Source IP address.
- Username involved in the event.
- Authentication event type.
- Target service.
- Target system.
- Time of the event.

The purpose was not simply to collect an IP address, but to understand how individual pieces of information can be combined to provide useful security context.

---

## Implementation

I began by reviewing the authentication log for the SSH event:


sudo grep "Invalid user" /var/log/auth.log

I then narrowed the results to the most recent events:

sudo grep "Invalid user" /var/log/auth.log | tail -10

From the log entry, I identified the source IP associated with the activity.

The source IP observed during the controlled test was:

192.168.10.101

This address belonged to my Kali Linux testing machine.

I also identified the username used during the test:

wronguser

The username was important because it demonstrated that an authentication attempt had been made using an account that did not exist on the Ubuntu server.

Identified Indicators

The investigation produced the following indicators:

Indicator	Value
Source IP	192.168.10.101
Username	wronguser
Service	SSH
Port	22
Event Type	Invalid user
Target Server	192.168.10.100

These indicators were associated with the controlled activity generated during the laboratory test.

Source IP Analysis

The source IP was the most useful network indicator identified during the investigation.

The address:

192.168.10.101

was already known to belong to the Kali Linux testing machine.

Because this was a controlled laboratory environment, I could confidently associate the event with the testing system.

In a real SOC environment, an analyst would not automatically assume that an IP address was malicious. Additional investigation would normally be required to determine the owner, reputation, geographical information, historical activity, and relationship to the affected system.

This distinction was important because an indicator is not automatically proof of malicious activity.

Username Analysis

The username involved in the event was:

wronguser

This was an invalid account that I intentionally used to generate the authentication event.

The presence of an invalid username can be useful during security monitoring because repeated attempts against multiple usernames may indicate account enumeration or automated SSH activity.

However, a single invalid username by itself does not prove that an attack is taking place.

The surrounding context and frequency of the events are important when determining the severity of the activity.

Event Context

I combined the indicators with the information already collected during the project.

The event occurred against the Ubuntu SSH service:

Target: 192.168.10.100
Service: SSH
Port: 22
Source: 192.168.10.101
Username: wronguser

This allowed me to reconstruct the basic event:

Kali Linux
192.168.10.101
      │
      │ SSH authentication attempt
      ▼
Ubuntu Server
192.168.10.100
      │
      ▼
Authentication Log
      │
      ▼
Invalid User Event

This provided sufficient context for the next stage of the investigation and response.

Verification

I verified the identified indicators against the earlier stages of the project.

The source IP matched the Kali Linux address recorded during the network configuration stage.

The target IP matched the Ubuntu server.

The service and port matched the SSH configuration.

The username matched the invalid account used during the controlled test.

This correlation confirmed that the indicators were consistent with the activity generated during the laboratory.

Outcome

The IOC investigation successfully identified several pieces of information that could be used during a security investigation.

The main indicators were:

Source IP: 192.168.10.101
Username: wronguser
Service: SSH
Port: 22
Event: Invalid user

These indicators provided the context required to make a decision about the appropriate response.

The next stage was therefore to demonstrate firewall-based containment of the identified source.

Reflection

This stage helped me understand that investigating an indicator requires context.

An IP address appearing in a log is not enough by itself to conclude that the source is malicious. I needed to compare it with the known network configuration and the activity I had generated.

The controlled nature of this project made that comparison straightforward because I knew exactly which machine generated the event.

In a real SOC environment, the same process would require much more investigation, including correlation with other logs, threat intelligence, endpoint information, and previous security events.

This stage therefore reinforced the importance of correlation rather than relying on a single indicator.

Screenshots

The following screenshots support this stage:https://github.com/SheuSec/ssh-threat-detection-firewall-response/blob/main/Screenshots/IOC-Investigation.pdf
