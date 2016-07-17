module BlogPostsHelper

  require 'Redcarpet'

  def parse_markdown(file_path)
    @renderer = @renderer || Redcarpet::Render::HTML.new(get_render_options)
    @markdown = @markdown || Redcarpet::Markdown.new(@renderer, get_markdown_options)
    file = File.open(file_path, 'r') # Open the md file to read
    file_content = file.read # Read all lines
    file.close # And we are done
    @markdown.render(file_content).html_safe
  end

  private

  def get_render_options()
    {} # TODO get these from config
  end

  def get_markdown_options()
    {} # TODO get these from config
  end
end
