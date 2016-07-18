def get_config(file)
  begin
    json_file = File.read(file)
    return JSON.parse(json_file)
  rescue StandardError => e
    STDERR.puts e.message
    STDERR.puts e.backtrace.inspect
    return nil
  end
end
