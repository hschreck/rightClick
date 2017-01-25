Rails.application.routes.draw do
  get '/', to: 'main#home'
  post '/', to: 'main#home'
  get 'main/home'

  get 'main/removeLast'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
