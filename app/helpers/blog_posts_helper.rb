module BlogPostsHelper

  require 'redcarpet'

  def parse_markdown(file_path)
    @renderer ||= Redcarpet::Render::HTML.new(render_options)
    @markdown ||= Redcarpet::Markdown.new(@renderer, markdown_options)
    file = File.open(file_path, 'r') # Open the md file to read
    file_content = file.read # Read all lines
    file.close # And we are done
    @markdown.render(file_content).html_safe
  end

  private

  def render_options
    {} # TODO: get these from config
  end

  def markdown_options
    {} # TODO: get these from config
  end
end
