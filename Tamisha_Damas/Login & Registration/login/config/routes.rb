Rails.application.routes.draw do
  root    'users#new'

  # New user
  get     'register'                =>  'users#new',          as: 'new_register'
  get     'user/new'                =>  'users#new'

  # Create user
  post    'register'                =>  'users#create',       as: 'register'
  post    'users'                   =>  'users#create'

  # Show users
  get     'users/:id'               =>  'users#show',         as: 'user'

  # New Login
  get     'login'                   =>  'sessions#new',       as: 'new_login'
  get     'sessions/new'            =>  'sessions#new'

  # Login
  post    'login'                   =>  'sessions#create',    as: 'login'
  post    'sessions'                =>  'sessions#create'

  # Logout users
  delete  'logout'                  =>  'sessions#destroy',   as: 'logout'
  delete  'sessions'                =>  'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
# Just remember that all named routes with end with _path
