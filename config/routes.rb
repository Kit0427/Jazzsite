Rails.application.routes.draw do
  root 'statics#top'
  resources :genres
  resources :diagnoses
  resources :statics
 
end
