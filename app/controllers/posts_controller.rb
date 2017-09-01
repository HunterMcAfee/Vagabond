class PostsController < ApplicationController
    def index
        # Grabs all posts for listing in the index
        @posts = Post.all
    end

    def show
        # Finds post and city information to display on post show page
        @post = Post.find(params[:id])
        @city = City.find(params[:city_id])
    end

    def new
        # Grabs city information and creates a new post to be used in the post form
        @city = city
        @post = city.posts.new
    end

    def create
        # Creates a new post
        @post = city.posts.new(post_params)

        # Upon trying to save post does validation check.  If false displays an alert.
        if @post.save
            redirect_to city_post_path(city, @post)
          else 
            flash.alert = "Title must be less than 200 characters and Content cannot be blank"
            redirect_to new_city_post_path
          end
        
    end

    def edit
        # Brings in post and city information for edit form
        @post = Post.find(params[:id])
        @city = City.find(params[:city_id])
    end

    def update
        # Brings in post information to update
        @post = city.posts.find(params[:id])
        
        # Checks validity of edited informatin.  If false displays an alert.
        if @post.update(post_params)
            redirect_to city_post_path(city, @post)
          else 
            flash.alert = "Title must be less than 200 characters and Content cannot be blank"
            redirect_to edit_city_post_path
          end
    end

    def destroy
        # Finds the post that was selected to delete and destroys it
        @post = city.posts.find(params[:id])
        @post.destroy
    
        redirect_to city_path(city)
      end

    def city
        # Method that pulls the city information from the parameters
        City.find(params[:city_id])
    end 

    private
        #Method that pulls the post information from the parameters
    def post_params
       params.require(:post).permit(:title, :content) 
    end

end
