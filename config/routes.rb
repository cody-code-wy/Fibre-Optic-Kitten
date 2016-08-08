Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'blog_posts#index'

  get '/posts', to: 'blog_posts#index'
  # get '/posts/:topic', to: 'blog_posts#topic'
  get '/posts/:topic/:post', to: 'blog_posts#subcontent'
  get '/posts/:topic/:subtopic/:post', to: 'blog_posts#post'

  get '/git/pull', to: 'git#pull'
  post '/git/pull', to: 'git#post_pull'

  get '/wizard', to: 'setup_wizard#setup'
  post '/wizard', to: 'setup_wizard#submit'
end
