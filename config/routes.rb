Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/posts', to: 'blog_posts#index'
  get '/posts/:topic', to: 'blog_posts#topic'

end
