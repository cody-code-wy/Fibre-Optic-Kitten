Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/posts', to: 'blog_posts#index'
  get '/posts/:topic', to: 'blog_posts#topic'
  get '/posts/:topic/:subcontent', to: 'blog_posts#subcontent' #subcontent as topics can directly contain static pages, and subtopics
  get '/posts/:topic/:subtopic/:post', to: 'blog_posts#post'

end
