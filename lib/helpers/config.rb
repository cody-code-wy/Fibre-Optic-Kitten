def get_config(file)
  json_data = []
  begin
    json_file = File.read(file)
    json_data = JSON.parse(json_file)
  rescue StandardError => e
    STDERR.puts e.message
    STDERR.puts e.backtrace.inspect
    json_data = nil
  end
  json_data
end
