# Network Configuration

## Objective

The first stage of the project was to establish a reliable network connection between the Ubuntu server and the Kali Linux testing machine.

I wanted to have a clear separation between the monitored system and the testing system so that I could generate controlled SSH activity from Kali and investigate the resulting events from Ubuntu.

The laboratory network was configured using the following addresses:

- **Ubuntu Server:** `192.168.10.100`
- **Kali Linux:** `192.168.10.101`
- **Network:** `192.168.10.0/24`

The objective at this stage was to confirm that both systems were connected to the same network and could communicate before moving on to SSH configuration and security testing.

---

## Implementation

I began on the Ubuntu server by checking the available network interfaces and their assigned addresses.

I used:


ip -br addr

This command gave me a quick overview of the network interfaces and allowed me to confirm the IP address assigned to the Ubuntu server.

The Ubuntu server was configured with:

192.168.10.100/24

I then checked the interface state using:

ip -br link

This allowed me to confirm that the relevant network interface was active.

I also checked the Kali Linux machine and confirmed that it was using:

192.168.10.101/24

Since both systems were on the 192.168.10.0/24 network, they were able to communicate within the laboratory environment.

I then performed basic connectivity testing between the systems before proceeding with the SSH configuration.

Verification

After completing the network configuration, I verified the addresses assigned to both machines.

System	IP Address	Role
Ubuntu Linux	192.168.10.100	Monitored Server
Kali Linux	192.168.10.101	Security Testing

I also confirmed that the network interfaces were active.

The connectivity test confirmed that communication between the two systems was available.

This verification was important because the remaining stages of the project depended on reliable communication between Kali and Ubuntu.

Outcome

The network environment was successfully established.

Ubuntu was configured as the monitored server at:

192.168.10.100

Kali Linux was configured as the testing machine at:

192.168.10.101

With the network communication working, I was able to proceed to the next stage of the project: configuring and verifying the SSH service on Ubuntu.

Reflection

This stage reinforced the importance of establishing a clear network baseline before beginning security testing.

Knowing which IP address belonged to each machine became particularly useful later in the project. When the Ubuntu authentication logs recorded an SSH event from 192.168.10.101, I could immediately associate that address with my Kali testing machine.

This made the later investigation easier because I already understood the network environment instead of treating the source IP as an unknown address.

Screenshots

The following evidence supports this stage:
https://github.com/SheuSec/ssh-threat-detection-firewall-response/blob/main/Screenshots/Network%20configuration.pdf
