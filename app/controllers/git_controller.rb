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
    head 200, content_type: "text/html"
  end

  def clone_repo (repo, branch)
    if Dir.exists?('blog content')
      FileUtils.rm_rf('blog content')
    end
    Git.clone(repo, branch, path: 'blog content/')
  end

end
