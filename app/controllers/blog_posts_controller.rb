class BlogPostsController < ApplicationController
  def initialize
    super
    @post_root = 'blog content/master/Posts'
  end

  def index
    @content_root = @post_root
  end

  def topic
    @content_root = "#{@post_root}/#{params[:topic]}"
  end

  def subcontent
    @content_root = "#{@post_root}/#{params[:topic]}/#{params[:post]}"
  end

  def post
    @content_root = "#{@post_root}/#{params[:topic]}/#{params[:subtopic]}/#{params[:post]}"
  end
end
