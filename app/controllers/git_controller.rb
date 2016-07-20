require 'json'
require 'git'
require 'fileutils'

class GitController < ApplicationController
  def pull
    update_repo('repo.conf')
    head 200, content_type: 'text/html'
  end

  def clone_repo(repo, branch)
    FileUtils.rm_rf('blog content') if File.exists?('blog content')
    Git.clone(repo, branch, path: 'blog content/')
  end

  def pull_repo(repo, branch)
    g = Git.open("blog content/#{branch}", log: Logger.new(STDOUT))
    g.pull(repo, branch)
  end

  def update_repo(config)
    conf = get_config(config)
    if conf
      if Dir.exist?("blog content/#{conf['branch']}")
        pull_repo(conf['repo'], conf['branch'])
      else
        clone_repo(conf['repo'], conf['branch'])
      end
    end
  end
end
