class BlogPostsController < ApplicationController

  @@post_root = 'blog content/master/Posts'

  def index()
    @dir_to_list = @@post_root
    @context = 'posts'
  end

  def topic()
    @dir_to_list = "#{@@post_root}/#{params[:topic]}"
    @context = params[:topic]
  end

  def subcontent()
    @content_root = "#{@@post_root}/#{params[:topic]}/#{params[:subcontent]}"
    @dir_to_list = @content_root # FIXME
    @context = params[:subcontent]
  end
end
