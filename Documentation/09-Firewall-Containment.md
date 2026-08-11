# Firewall Containment

## Objective

After identifying the source IP associated with the suspicious SSH authentication event, I moved to the containment stage of the investigation.

The objective was to demonstrate how a firewall can be used to restrict network access from an identified source.

In this laboratory, the source IP was:

192.168.10.101

This was the Kali Linux testing machine that generated the controlled SSH activity.

Because the activity was part of my own controlled laboratory test, the firewall response was also performed within the lab environment.

Implementation

Before applying the containment rule, I checked the current UFW configuration:

sudo ufw status numbered

This allowed me to review the existing firewall rules before making a change.

I then created a firewall rule to deny SSH traffic from the identified source IP:

sudo ufw deny from 192.168.10.101 to any port 22 proto tcp

The purpose of this rule was to prevent the identified source from establishing SSH connections to the Ubuntu server.

After adding the rule, I checked the firewall configuration again:

sudo ufw status numbered

This allowed me to confirm that the new deny rule had been added successfully.

Containment Logic

The response followed a simple security workflow:

SSH Authentication Event
        ↓
Log Investigation
        ↓
Source IP Identified
        ↓
192.168.10.101
        ↓
Firewall Rule Created
        ↓
SSH Access Restricted

The important part of this process was that the firewall response was based on information obtained during the investigation rather than simply blocking an unknown address without context.

Verification

After applying the firewall rule, I tested the SSH connection from the Kali Linux machine:

ssh ola@192.168.10.100

The connection was no longer allowed because the source IP had been restricted by the firewall rule.

I then checked the firewall configuration again:

sudo ufw status numbered

The deny rule for the Kali IP address was visible in the active firewall configuration.

This confirmed that the containment rule had been applied.

Important Observation

During the testing process, I also learned that firewall rules must be interpreted carefully.

If an existing allow rule is placed before a deny rule, the resulting behaviour may not be what was expected.

For this reason, I checked the numbered UFW rules instead of assuming that adding a new rule automatically guaranteed the desired result.

This was an important part of the testing process because firewall configuration should always be validated after a security response.

Outcome

The identified source IP was successfully added to the UFW firewall rules for SSH containment.

The response demonstrated how an identified source can be restricted from accessing a specific service.

The containment process therefore followed:

Detect → Investigate → Identify → Contain

The next stage was to validate the firewall response using additional testing rather than relying only on the presence of the firewall rule.

Reflection

This stage showed me that detection and response are closely connected.

Finding a suspicious event is only part of the job. Once an indicator has been investigated and a response has been selected, the response itself needs to be tested.

The firewall provided a simple and practical containment mechanism in this laboratory.

However, I also learned that blindly blocking an address is not always appropriate. In a real environment, the source could belong to a legitimate administrator, monitoring system, or business application.

For that reason, firewall containment should normally be based on sufficient investigation and should be followed by validation.

Screenshots

The following screenshots support this stage:
