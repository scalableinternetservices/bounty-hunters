#/bin/bash
cd ~/bounty-hunters/load_tests
tsung -n -f BH-tests.xml start
if [ $? -eq 0 ]; then
    cd /home/ec2-user/.tsung/log
    cd $( ls -1 | tail -1 )
    tsung_stats.pl
    echo "#####################"
    echo "tsung load test succeeded, graphs created"
else
    echo "!!!!!!!!!!!!!!!!!!!!!"
    echo "error in BH-tests.xml, tsung load test failed"
fi