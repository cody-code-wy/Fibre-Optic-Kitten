require 'json'
require 'git'
require 'fileutils'

def get_config (config_file)
  json_data = []
  begin
    json_file = File.read(config_file)
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

def pull_repo (repo, branch)
  g = Git.open("blog content/#{branch}", log: Logger.new(STDOUT))
  g.pull(repo, branch)
end

def update_repo(config)
  conf = get_config('blog.conf')
  if conf
    if File.directory?(config)
      pull_repo(conf['repo'], conf['branch'])
    else
      clone_repo(conf['repo'], conf['branch'])
    end
  end
end