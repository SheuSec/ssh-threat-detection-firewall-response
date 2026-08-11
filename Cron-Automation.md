# Cron Automation

## Objective

After creating and testing the SSH detection script, I wanted to make the detection process run automatically instead of manually executing the script each time.

For this stage, I used **Cron**, the Linux task scheduler, to run the detection script at regular intervals.

The objective was to demonstrate how a simple security detection script could be converted from a manual process into an automated monitoring task.

---

## Implementation

I first opened the Cron configuration for my Ubuntu user using:


crontab -e

This opened the user's personal Cron configuration file.

I then added the following scheduled task:

*/1 * * * * /home/ola/ssh_alart.sh

This configuration tells Cron to execute the detection script once every minute.

The script being executed was:

/home/ola/ssh_alart.sh

The decision to run the script every minute was made for the laboratory so that I could easily observe the automation during testing.

Understanding the Cron Entry

The Cron schedule contains five time fields followed by the command:

┌──── minute
│ ┌── hour
│ │ ┌ day of month
│ │ │ ┌ month
│ │ │ │ ┌ day of week
│ │ │ │ │
*/1 * * * * /home/ola/ssh_alart.sh

The */1 value in the minute field means that the script should run every minute.

The remaining * values mean that there are no additional restrictions on the hour, day, month, or day of the week.

The final part specifies the script that Cron should execute.

Verification

After saving the Cron configuration, I checked the scheduled tasks using:

crontab -l

This displayed the Cron entry I had created.

I confirmed that the following entry was present:

*/1 * * * * /home/ola/ssh_alart.sh

I then allowed the scheduled task to run and checked the detection output to confirm that the script was being executed automatically.

The alert log provided evidence that the scheduled script was running without requiring me to manually execute it each time.

Testing the Automation

To test the complete process, I generated the controlled SSH authentication activity again from the Kali Linux machine.

The Ubuntu server recorded the authentication event in:

/var/log/auth.log

The scheduled detection script then searched the authentication log and recorded relevant events in:

security_alarts.log

This created the following workflow:

Kali SSH Activity
        ↓
Ubuntu Authentication Log
        ↓
Cron
        ↓
SSH Detection Script
        ↓
Security Alert Log

This demonstrated how the individual components of the project could work together as a simple automated detection system.

Verification

I verified the automation by confirming that:

The Cron job was saved successfully.
crontab -l displayed the scheduled task.
The detection script was executable.
The script ran automatically.
The authentication log remained the original source of evidence.
Detection results were written to the alert log.

These checks confirmed that the detection process was no longer dependent entirely on manual execution.

Outcome

The SSH detection script was successfully scheduled to run automatically using Cron.

The project therefore progressed from manual investigation to basic automated monitoring.

The resulting workflow was:

Authentication Event
        ↓
Log Collection
        ↓
Automated Detection
        ↓
Alert Generation

This provided the foundation for the next stage of the project, where I investigated the indicators associated with the detected activity.

Reflection

Using Cron showed me how even a simple Linux scheduling mechanism can be useful when combined with a detection script.

The solution is basic compared with the automation used in a professional SOC environment, but it helped me understand an important principle: security monitoring becomes more useful when detection does not depend entirely on a person manually checking logs.

In a production environment, this type of detection could be replaced or extended with a SIEM, centralized logging system, alerting platform, or other security monitoring solution.

For this laboratory, Cron provided a simple and understandable way to demonstrate automated security monitoring.

Screenshots

The following screenshots support this stage:
