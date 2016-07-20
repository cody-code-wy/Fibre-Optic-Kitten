def get_config(file)
  json_file = File.read(file)
  return JSON.parse(json_file)
rescue StandardError => e
  STDERR.puts e.message
  STDERR.puts e.backtrace.inspect
  return nil
end

def get_repo_config(file)
  config = get_config('repo.conf')
  get_config("blog content/#{config['branch']}/#{file}")
end
