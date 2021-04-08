class TemporadasController < ApplicationController
    def show
        @response = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/episodes', :params => {:series => params[:info][:series]}).body
        if @response[0] 
            @season = params[:info][:season]
            @series = params[:info][:series]
        end
    end
end
