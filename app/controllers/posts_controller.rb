class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def show
        @post = Post.find(params[:id])
        @city = City.find(params[:city_id])
    end
end
