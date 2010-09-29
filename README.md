Script to remove old cruise builds from all projects in the cruisecontrol directory.


# sample crontab 
To run the purge job nightly at midnight and store output in /tmp/pruned_cruise_builds.log:

    0 0 * * * /home/cruise/bin/prune_cruise_builds.rb  >> /tmp/pruned_cruise_builds.log 2>&1

Or you can run from the shell by typing

    /home/cruise/bin/prune_cruise_builds.rb

# Options

Change one of these options in the script to match your needs

    ## change to the directory where cruise stores the projects on your server
    CRUISE_PROJECTS_HOME = '/srv/cruise/projects'
    ## change this to keep more or fewer builds
    BUILDS_TO_KEEP       = 10                     

# Logic

For each project in the cruise project directory the script will

* Find the most recent successful build
* Count backward 10 builds from there (based on the BUILDS_TO_KEEP parameter)
* Delete all builds older than that

It will always keep at least 10 builds and ensure it keeps the most recent successful build.

# Feedback

If you find this useful or want to enhance it please fork the project and submit a pull request or create an issue or drop me a line.

