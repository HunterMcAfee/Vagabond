class PostsController < ApplicationController
    def index
        @posts = Post.all
    end
    def show
        @post = Post.find(params[:id])
        @city = City.find(params[:city_id])
    end

    def new
        @city = city
        @post = city.posts.new
    end

    def create
        @post = city.posts.create!(post_params)

        redirect_to city_post_path(city, @post)
    end

    private
    def post_params
       params.require(:post).permit(:title, :content) 
    end

end
