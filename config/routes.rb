Rails.application.routes.draw do
  
  # ルート
  root to: 'react_crud_data#index'

  get    'react_crud_data/index'  
  get    'react_crud_data/new',  to: 'react_crud_data#new',     as: 'new_react_crud_data'
  post   'react_crud_data',      to: 'react_crud_data#create'
  put    'react_crud_data/:id',  to: 'react_crud_data#update'
  delete 'react_crud_data/:id',  to: 'react_crud_data#destroy'
end
