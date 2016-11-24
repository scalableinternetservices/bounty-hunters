#/bin/bash
cd ~/bounty-hunters/load_tests
tsung -n -f BH-tests.xml start

cd /home/ec2-user/.tsung/log
cd $( ls -l | tail -1 )
tsung_stats.pl