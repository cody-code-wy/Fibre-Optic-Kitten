class BlogPostsController < ApplicationController

  @@post_root = 'blog content/master/Posts'

  def index()
    @post_root = @@post_root
  end
end
