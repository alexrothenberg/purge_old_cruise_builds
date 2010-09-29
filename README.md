Script to remove old cruise builds from all projects in the cruisecontrol directory.


sample crontab to run nightly at midnight:

    0 0 * * * /home/cruise/bin/prune_cruise_builds.rb  >> /tmp/pruned_cruise_builds.log 2>&1
