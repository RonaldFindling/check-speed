#!/bin/sh

# outputs the dateTime, downloadSpeed and uploadSpeed as csv
# dateTime has the format 'yyyy.mm.dd hh:mm:ss AM|PM'
# upload and download should be in Mbit/s

time=`date '+%Y.%m.%d %X'`
speedtestResult=`speedtest-cli ` #| grep -E "Download: |Upload: "`
download=`echo $speedtestResult | grep -E "Download: " | sed 's/.*Download: \([0-9]\.[0-9][0-9]*\).*/\1/' `
upload=`echo $speedtestResult | grep -E "Upload: " | sed 's/.*Upload: \([0-9]\.[0-9][0-9]*\).*/\1/' `
printf "${time},${download},${upload}\n"

