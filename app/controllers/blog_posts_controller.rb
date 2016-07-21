class BlogPostsController < ApplicationController
  def initialize
    super
    @post_root = 'blog content/master/Posts'
  end

  def index
    @content_root = @post_root
    redirect_to '/wizard' unless get_config('repo.conf')
  end

  def topic
    @content_root = "#{@post_root}/#{params[:topic]}"
    redirect_to '/wizard' unless get_config('repo.conf')
  end

  def subcontent
    @content_root = "#{@post_root}/#{params[:topic]}/#{params[:post]}"
    redirect_to '/wizard' unless get_config('repo.conf')
  end

  def post
    @content_root = "#{@post_root}/#{params[:topic]}/#{params[:subtopic]}/#{params[:post]}"
    redirect_to '/wizard' unless get_config('repo.conf')
  end
end
