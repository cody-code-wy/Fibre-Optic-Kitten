module BlogPostsHelper

  require 'redcarpet'
  require 'pathname'

  def parse_markdown(file_path)
    @renderer ||= Redcarpet::Render::HTML.new(render_options)
    @markdown ||= Redcarpet::Markdown.new(@renderer, markdown_options)
    file = File.open(file_path, 'r') # Open the md file to read
    file_content = file.read # Read all lines
    file.close # And we are done
    @markdown.render(file_content).html_safe
  end

  def get_recent_posts(content_root, count=10)
    Dir.glob("#{content_root}/**/*.md").sort_by { |f| File.mtime(f) }.reverse.first(count).each { |f| yield f }
  end

  def get_basename(path)
    base = Pathname.new(path)
    if (base.basename.to_s == 'index.md') 
      base = base.parent
    end
    return base.basename(".*")
  end

  def get_link(path, root)
    full_path = Pathname.new(path)
    short_path = full_path.relative_path_from(Pathname.new(root))
    folders, file = short_path.split
    file = file.basename(".*")
    return "/posts/#{folders}/#{file}"
  end

  private

  def render_options
    {} # TODO: get these from config
  end

  def markdown_options
    {
        tables: true,
        fenced_code_blocks: true,
        autolink: true,
        strikethrough: true
    } # TODO: get these from config
  end
end
