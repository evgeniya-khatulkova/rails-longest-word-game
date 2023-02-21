Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "grid", to: "words#new"
  post "/words/:grid", to: "words#score"
  get "score", to: "words#score"
end
