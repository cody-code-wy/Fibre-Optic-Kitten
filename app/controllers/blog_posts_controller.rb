class BlogPostsController < ApplicationController

  @@post_root = 'blog content/master/Posts'

  def index
    @post_root = @@post_root
  end

  def topic
    @topic_root = "#{@@post_root}/#{params[:topic]}"
  end

  def subcontent
    @content_root = "#{@@post_root}/#{params[:topic]}/#{params[:subcontent]}"
  end

  def post()
    @content_root = "#{@@post_root}/#{params[:topic]}/#{params[:subtopic]}/#{params[:post]}"
  end
end
