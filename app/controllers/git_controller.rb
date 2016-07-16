require 'json'
require 'git'
require 'fileutils'

class GitController < ApplicationController

  def pull
    conf = get_config
    puts conf
    if conf
      clone_repo(conf['repo'], conf['branch'])
    end
    render :temp
  end

  def get_config
    json_data = []
    begin
      json_file = File.read('blog.conf')
      puts json_file
      json_data = JSON.parse(json_file)
    rescue Exception => e
      puts e.message
      puts e.backtrace.inspect
      json_data = nil
    end
    json_data
  end

  def clone_repo (repo, branch)
    if File.directory?('blog content')
      FileUtils.rm_rf('blog content')
    end
    Git.clone(repo, branch, path: 'blog content/')
  end

end
