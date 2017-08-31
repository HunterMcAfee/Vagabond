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
        @post = city.posts.new(post_params)

        if @post.save
            redirect_to city_post_path(city, @post)
          else 
            flash.alert = "Title must be less than 200 characters and Content cannot be blank"
            redirect_to new_city_post_path
          end
        
    end

    def edit
        @post = Post.find(params[:id])
        @city = City.find(params[:city_id])
    end

    def update
        @post = city.posts.find(params[:id])
        
        if @post.update(post_params)
            redirect_to city_post_path(city, @post)
          else 
            flash.alert = "Title must be less than 200 characters and Content cannot be blank"
            redirect_to edit_city_post_path
          end
    end

    def destroy
        @post = city.posts.find(params[:id])
        @post.destroy
    
        redirect_to city_path(city)
      end

    def city
        City.find(params[:city_id])
    end 

    private
    def post_params
       params.require(:post).permit(:title, :content) 
    end

end
