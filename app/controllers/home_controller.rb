require 'http'
class HomeController < ApplicationController
    def index
        @series = {}
        @response = JSON.parse HTTP.get('https://tarea-1-breaking-bad.herokuapp.com/api/episodes').body
        if @response[0] 
            @response.each do |episodio|
                if @series.keys.include?(episodio["series"])
                    if not @series[episodio["series"]].include?(episodio["season"])
                        @series[episodio["series"]].push(episodio["season"])
                    end
                else
                    aux = {episodio["series"]=> []}
                    @series.merge!(aux)
                    @series[episodio["series"]].push(episodio["season"])
                end
            end
        end
    end
end
