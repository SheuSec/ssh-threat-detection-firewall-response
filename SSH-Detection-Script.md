# SSH Detection Script

## Objective

After investigating the SSH authentication logs manually, I wanted to make the detection process more efficient.

Manually searching `/var/log/auth.log` works during a small investigation, but it becomes less practical when authentication events increase.

The objective of this stage was therefore to create a simple Bash script that could search the authentication log for indicators of suspicious SSH activity and record the findings.

The script was designed to identify:

- Failed SSH authentication attempts.
- Invalid SSH users.
- Source IP addresses associated with the events.

This was my first step toward introducing basic automation into the monitoring process.

---

## Implementation

I created a Bash script named:

ssh_alart.sh

The script was designed to search the Ubuntu authentication log for relevant SSH events.

The main log being monitored was:

/var/log/auth.log

The script used grep to search for authentication events containing:

Failed password

and:

Invalid user

I used these indicators because they were relevant to the controlled SSH activity generated earlier in the project.

The basic detection command used by the script was:

grep -Ei "Failed password|Invalid user" /var/log/auth.log

The -E option allowed multiple patterns to be searched, while -i made the search case-insensitive.

Creating the Detection Script

I created the script on the Ubuntu server and added the Bash commands required to search the authentication log.

The script was structured to write the detected events into a separate alert log rather than modifying the original authentication log.

The output file used for the detection results was:

security_alarts.log

This separation was important because the original system log should remain intact as the primary source of evidence.

Making the Script Executable

After creating the script, I gave it execute permission using:

chmod +x ~/ssh_alart.sh

I then confirmed that the script could be executed directly:

~/ssh_alart.sh

This allowed me to test the detection logic before introducing automation.

Testing the Detection

After running the script, I checked the generated alert log using:

cat ~/security_alarts.log

The output contained SSH authentication events identified by the script.

The results could then be compared with the original authentication log:

sudo grep -Ei "Failed password|Invalid user" /var/log/auth.log

This comparison allowed me to verify that the detection script was identifying the same type of events that I had previously found during the manual investigation.

Source IP Identification

Another part of the detection process was identifying the source IP associated with the SSH event.

The authentication log contained the source address:

192.168.10.101

I could therefore associate the event with the Kali Linux testing machine.

This demonstrated how a simple script can extract useful information from raw security logs and make the investigation process easier.

Verification

I verified the detection script by confirming that:

The script executed successfully.
The authentication log could be searched.
Invalid SSH users could be identified.
Failed authentication events could be identified.
Relevant events were written to the alert log.
The source IP could be identified from the log data.

The detection results were consistent with the controlled SSH activity generated earlier in the project.

Outcome

The Bash detection script successfully provided a simple automated method for identifying suspicious SSH authentication events.

The monitoring process had now developed from:

Manual Log Search
        ↓
Identify SSH Event
        ↓
Create Detection Script
        ↓
Generate Alert Log

This provided the foundation for the next stage, where I automated the execution of the detection script using Cron.

Reflection

Creating the detection script helped me understand the basic idea behind detection engineering.

The important part was not simply writing a Bash command. I first had to understand what normal and suspicious activity looked like in the authentication log and then translate that understanding into a repeatable detection rule.

The script is intentionally simple and is not intended to replace a SIEM or enterprise detection platform.

However, it demonstrated an important security concept:

Raw log data can be transformed into a repeatable detection process.

This was a useful step toward thinking more like a SOC analyst, where the goal is not only to investigate an event after it happens but also to create mechanisms that can identify similar events more efficiently.

Screenshots

The following screenshots support this stage:
