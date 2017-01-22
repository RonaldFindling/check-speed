#!/bin/bash

################################################################################
# add the needed cron-jobs http://stackoverflow.com/a/29396336
################################################################################

####################
# set PATH in cron
####################
cron_path="PATH=/home/ubuntu/bin:/home/ubuntu/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

# Check if cron job already in crontab
if crontab -l | grep -Fxq "${cron_path}"
then
    echo "Crontab already exists. Exiting..."
else
	echo "Adding job to crontab."
    # Write out current crontab into temp file
    crontab -l > mycron
    # Append new cron into cron file
    echo "${cron_path}" >> mycron
    # Install new cron file
    crontab mycron
    # Remove temp file
    rm mycron
fi

####################
# check speed job
####################
cron1="*/2 * * * * /vagrant/check_speed/check_internet_speed.sh >> /vagrant/check_speed/speedtest_values.csv"
# Escape all the asterisks so we can grep for it
cron1_escaped=$(echo "$cron1" | sed s/\*/\\\\*/g)

# Check if cron job already in crontab
if crontab -l | grep -Fxq "${cron1_escaped}"
  then
    echo "Crontab already exists. Exiting..."
    exit
  else
	echo "Adding job to crontab."
    # Write out current crontab into temp file
    crontab -l > mycron
    # Append new cron into cron file
    echo "${cron1}" >> mycron
    # Install new cron file
    crontab mycron
    # Remove temp file
    rm mycron
fi

####################
# create report job
####################
cron2='*/1 * * * * /vagrant/check_speed/create_internet_speed_report.sh -i /vagrant/check_speed/monitor_internet_speed.Rmd -o /vagrant/check_speed/monitor_internet_speed.pdf -d /vagrant/check_speed/speedtest_values.csv' 
# Escape all the asterisks so we can grep for it
cron2_escaped=$(echo "$cron2" | sed s/\*/\\\\*/g)

# Check if cron job already in crontab
if crontab -l | grep -Fxq "${cron2_escaped}"
  then
    echo "Crontab already exists. Exiting..."
    exit
  else
	echo "Adding job to crontab."
    # Write out current crontab into temp file
    crontab -l > mycron
    # Append new cron into cron file
    echo "${cron2}" >> mycron
    # Install new cron file
    crontab mycron
    # Remove temp file
    rm mycron
fi
