Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  root 'courses#index'

  resources :courses
  get '/collections/:collection_id/courses/:course_id/belongs_to', to: 'courses#check_membership', as: :check_membership
end
