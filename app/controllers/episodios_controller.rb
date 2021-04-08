class EpisodiosController < ApplicationController
    def show
        @person = {}
        @response = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/episodes/' +params[:id]).body
        if @response[0] 
            @response[0]["characters"].each do |personaje|
                respuesta = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/characters' , :params => {:name => personaje}).body
                aux = {personaje => respuesta[0]["char_id"]}
                @person.merge!(aux)
            end
        end
    end
end
