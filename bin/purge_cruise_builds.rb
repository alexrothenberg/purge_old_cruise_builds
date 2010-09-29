#! /usr/bin/env ruby

require 'fileutils'

## change this to keep more or fewer builds
BUILDS_TO_KEEP = 10

def prune_all_cruise_projects
  puts "Pruning old cruise builds #{Time.now}"
  Dir['/srv/cruise/projects/*'].each do |project|
    prune_project(project)
  end
end


def prune_project(project_dir)
  sorted_builds = Dir["#{project_dir}/build-*"].sort {|a,b| File.new(a).mtime <=> File.new(b).mtime}.reverse
  most_recent_success = sorted_builds.detect {|f| f =~ /success/ }
  return if most_recent_success.nil?

  index_of_most_recent_success = sorted_builds.index(most_recent_success)
  builds_to_remove = sorted_builds[(index_of_most_recent_success+BUILDS_TO_KEEP)..sorted_builds.length] || []

  puts "Removing #{builds_to_remove.size} builds from #{project_dir} ..."
  builds_to_remove.each do |build| 
    FileUtils.rm_rf  build 
    puts "  #{build}"
  end
end
