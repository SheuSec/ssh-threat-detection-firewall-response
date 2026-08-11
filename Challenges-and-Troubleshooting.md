# Challenges and Troubleshooting

## Objective

During the development of this SSH threat detection and firewall response laboratory, I encountered several issues while configuring the environment and testing the security controls.

The purpose of documenting these challenges is to show how I approached troubleshooting rather than only documenting the successful results.

In a real cybersecurity environment, troubleshooting is an important part of security operations because detection systems, network controls, scripts, and scheduled tasks do not always behave as expected on the first attempt.

---

## Challenge 1 — SSH Connectivity

One of the first areas I had to verify was communication between the Kali Linux testing machine and the Ubuntu server.

Before troubleshooting the SSH service itself, I checked the IP configuration on both machines.

I used:


ip -br addr

This allowed me to confirm that Ubuntu and Kali were using the expected addresses.

The laboratory configuration was:

Ubuntu: 192.168.10.100
Kali:   192.168.10.101

I then tested connectivity between the systems before continuing with the SSH configuration.

This helped me separate network problems from SSH service problems.

Challenge 2 — UFW Rule Management

Another challenge occurred while working with UFW firewall rules.

As I added and removed rules during testing, the numbered rules changed.

I used:

sudo ufw status numbered

to review the active rules before making changes.

When removing a rule, I used:

sudo ufw delete <rule-number>

I learned that the rule number must always be checked before deletion because UFW can renumber the remaining rules after a rule is removed.

This prevented me from accidentally deleting the wrong firewall rule.

Challenge 3 — SSH Authentication Logs

The authentication log contained many different events, which made manually reviewing the entire file inefficient.

Instead of reading the complete log, I used filtering commands such as:

sudo grep "Invalid user" /var/log/auth.log

and:

sudo grep "Failed password" /var/log/auth.log

I also used:

sudo grep "sshd" /var/log/auth.log | tail -20

These commands helped me focus specifically on SSH-related activity.

This was an important lesson because log analysis is much more effective when the analyst knows what indicators to search for.

Challenge 4 — Cron Configuration

While configuring the Cron automation, I initially encountered an error when entering the scheduled task.

The problem was caused by the Cron schedule format.

Cron requires five time fields before the command:

minute hour day-of-month month day-of-week command

The final entry used for the laboratory was:

*/1 * * * * /home/ola/ssh_alart.sh

I verified the installed task using:

crontab -l

This confirmed whether the entry had actually been saved.

This experience reinforced the importance of checking Cron syntax carefully because a small formatting mistake can prevent the scheduled task from being installed.

Challenge 5 — Detection Script Testing

Another part of the troubleshooting process involved verifying that the detection script was actually identifying the expected SSH events.

Rather than assuming that the script worked because it executed without an error, I compared its output with the original authentication log.

I used:

sudo grep -Ei "Failed password|Invalid user" /var/log/auth.log

and then checked the detection output:

cat ~/security_alarts.log

Comparing the two outputs helped me determine whether the detection logic was producing the expected results.

This approach made the testing process more reliable.

Challenge 6 — Firewall Validation

One of the most important lessons came from validating the firewall response.

Adding a firewall rule does not automatically mean that the expected traffic will be blocked.

I therefore checked the active rules using:

sudo ufw status numbered

and tested the SSH service from Kali.

I also used Nmap to examine the SSH port:

nmap -p 22 192.168.10.100

This allowed me to compare the firewall configuration with the actual network behaviour.

The testing helped me understand that firewall configuration and firewall validation are two separate steps.

Troubleshooting Approach

When I encountered a problem, I tried to avoid changing several things at once.

My general troubleshooting process was:

Identify the Problem
        ↓
Check the Current Configuration
        ↓
Test the Suspected Component
        ↓
Make One Change
        ↓
Test Again
        ↓
Document the Result

This approach made it easier to determine which change solved the problem.

It also reduced the risk of introducing additional configuration errors while troubleshooting.

Outcome

The issues encountered during the project were resolved through incremental testing and verification.

The troubleshooting process helped me understand the relationship between:

Network connectivity
SSH services
Authentication logs
Bash scripts
Cron automation
UFW firewall rules
Nmap validation

Rather than treating each component as an isolated tool, I learned to investigate how one component affected another.

Reflection

The troubleshooting stage was one of the most valuable parts of the project.

Security labs rarely work perfectly on the first attempt, and encountering errors is part of learning how systems actually behave.

I learned that troubleshooting should be evidence-driven. Instead of guessing, I checked the current state, tested the relevant component, made a controlled change, and then verified the result.

This is also relevant to SOC work. When an alert or security control behaves unexpectedly, an analyst needs to understand the underlying system before deciding what action to take.

Documenting the challenges also made the project more realistic because it shows not only the final configuration, but the reasoning and problem-solving involved in reaching it.
