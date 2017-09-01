class CitiesController < ApplicationController
    def index
        # Grabs all the cities to be displayed on the city index page
        @cities = City.all
    end

    def show
        # Grabs city and all of the posts associated that city (would also be considered post index page) 
        @city = City.find(params[:id])
        @posts = @city.posts
    end
end
