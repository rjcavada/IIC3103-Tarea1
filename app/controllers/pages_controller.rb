class PagesController < ApplicationController
    def search
        @parameter = params[:search].downcase 
        @response = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/characters', :params => {:name => @parameter}).body
    end
end
