class BlogPostsController < ApplicationController
  def initialize
    super
    @post_root = 'blog content/master/Posts'
  end

  def index
    @dir_to_list = @post_root
    @context = 'posts'
  end

  def topic
    @dir_to_list = "#{@post_root}/#{params[:topic]}"
    @context = params[:topic]
  end

  def subcontent
    @content_root = "#{@post_root}/#{params[:topic]}/#{params[:subcontent]}"
    @context = params[:subcontent]
  end

  def post
    @content_root = "#{@post_root}/#{params[:topic]}/#{params[:subtopic]}/#{params[:post]}"
  end
end
