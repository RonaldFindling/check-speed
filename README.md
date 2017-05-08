# check-speed
Linux tool to automatically monitor your up/download speed and create speed-reports.

## Installation
You need to have virtualbox and vagrant installed.
Then run:
```
vagrant up
```
After that the vagrant box is up running and schedules speed-checks as well as creates a pdf reports every 5 minutes.
This can be changed with `crontab` inside the vagrant box.
```
ssh vagrant
crontab -e
```
Change the corresponding crontab schedules to whatever fits your needs (be aware that the check will use up your bandwith for about 30 seconds.
