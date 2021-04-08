class PersonajesController < ApplicationController
    def show
        @response = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/characters/' +params[:id]).body
        if @response[0]
            @quotes = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/quote', :params => {:author => @response[0]["name"]}).body
        end
    end
end
