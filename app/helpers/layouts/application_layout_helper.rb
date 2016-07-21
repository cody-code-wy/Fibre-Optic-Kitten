require_relative '../../../lib/helpers/config'
require 'pathname'

module Layouts
  module ApplicationLayoutHelper
    @config = get_config('repo.conf')

    @post_root = "blog content/#{@config['branch']}/Posts"

    def list_dir(dir)
      Dir.entries(dir).each do |file|
        if Dir.exist?("#{dir}/#{file}") && !(file.start_with?('.'))
          yield(file)
        end
      end
    end

    def get_index_link(dir, root=nil)
      path = "#{"#{root}/" if root}#{dir}"
      if File.exist?("#{@post_root}/#{path}/index.md")
        "<a href=\"/posts/#{path}/index.html\">#{dir}</a>".html_safe
      else
        dir
      end
    end

    def list_post(dir)
      Dir.glob("#{dir}/{[!index]*}.md").each do |file|
        yield Pathname.new(file).basename
      end
    end

    def should_hide_topic(topic)
      if controller_name == "blog_posts"
        if ["topic","subcontent","post"].include? action_name
          return topic != params[:topic]
        end
      end
      true
    end

    def should_hide_subtopic(topic, subtopic)
      if controller_name == "blog_posts"
        if ["subcontent","post"].include? action_name
          if topic == params[:topic]
            return ! (
              subtopic == params[:subcontent] ||
              subtopic == params[:subtopic]
            )
          end
        end
      end
      true
    end
  end
end
