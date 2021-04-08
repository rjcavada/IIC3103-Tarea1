class PagesController < ApplicationController
    def search
        if params[:info]
            @parameter = params[:info][:search].downcase
            @vez = params[:info][:next]
            @response = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/characters', :params => {:name => @parameter, :limit => 10, :offset => @vez}).body
            @response2 = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/characters', :params => {:name => @parameter, :limit => 10, :offset => (@vez.to_i+10)}).body
            if @response2 == []
                @vacio = true
            else
                @vacio = false
            end
        else
            @parameter = params[:search].downcase 
            @response = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/characters', :params => {:name => @parameter}).body
            @response2 = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/characters', :params => {:name => @parameter, :limit => 10, :offset => 10}).body
            if @response2 == []
                @vacio = true
            else
                @vacio = false
            end
            @vez = 0
        end
    end
end
