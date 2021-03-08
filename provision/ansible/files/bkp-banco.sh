#!/bin/bash
mysqldump --user="rsysloguser" --password="rsyslogpw" "$@" "Syslog" > "/opt/backup/syslog-$(date '+%d-%m-%Y')".sql 2> /dev/null
