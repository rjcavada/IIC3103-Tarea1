Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root "home#index"

get "/home", to: "home#index"
get 'temporadas/view_details', to: 'temporadas#show', as: 'temporada'
get 'episodios/:id', to: "episodios#show", as: 'episodio'
get 'personajes/:id', to: "personajes#show", as: 'personaje'
get '/search' => 'pages#search', :as => 'search_page'
end
