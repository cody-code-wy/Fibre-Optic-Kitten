Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'git', to: :show, controller: 'git'
  get '/git/pull', to: 'git#pull'

end
