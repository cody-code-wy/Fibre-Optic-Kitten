require 'json'
require 'git'
require 'fileutils'

class GitController < ApplicationController

  def pull
<<<<<<< HEAD
    conf = get_config
    puts conf
    if conf
      clone_repo(conf['repo'], conf['branch'])
    end
    head 200, content_type: "text/html"
=======
    update_repo('blog.conf')
    head 200, content_type: 'text/html'
>>>>>>> 68321a0... fixup! Add git/pull route w/ basic implementation
  end

  def clone_repo (repo, branch)
    if Dir.exists?('blog content')
      FileUtils.rm_rf('blog content')
    end
    Git.clone(repo, branch, path: 'blog content/')
  end

<<<<<<< HEAD
=======
  def pull_repo (repo, branch)
    g = Git.open("blog content/#{branch}", log: Logger.new(STDOUT))
    g.pull(repo, branch)
  end

  def update_repo(config)
    conf = get_config(config)
    if conf
      if File.directory?("blog content/#{conf['branch']}")
        pull_repo(conf['repo'], conf['branch'])
      else
        clone_repo(conf['repo'], conf['branch'])
      end
    end
  end

>>>>>>> 68321a0... fixup! Add git/pull route w/ basic implementation
end
