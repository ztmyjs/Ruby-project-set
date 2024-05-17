Rails.application.routes.draw do
  resources :presentations
  resources :team_members
  resources :teams
  resources :surveys
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "static_pages/home"

  get "teams_index" => "teams#index"
  get "presentations_index" => "presentations#index"
  get "presentations_show" => "presentations#show"
  get "presentations_new" => "presentations#new"
  get "team_members_new" => "team_members#new"
  get "team_members_show" => "team_members#show"
  get "surveys_new" => "surveys#new"
  get "surveys_show" => "surveys#show"
  get "surveys_index" => "surveys#index"

  root "static_pages#home"
end
