class PostsController < ApplicationController
    def index
        # Grabs all posts for listing in the index
        @user = current_user.id
        @posts = Post.all
    end

    def show
        # Finds post and city information to display on post show page
        @user = current_user.id
        @post = Post.find(params[:id])
        @city = City.find(params[:city_id])
    end

    def new
        # Grabs city information and creates a new post to be used in the post form
        @user = current_user.id
        @city = city
        @post = city.posts.new
    end

    def create
        # Creates a new post
        @user = current_user.id
        @post = city.posts.new(post_params)
        @post.user_id = @user
        puts "This is the post information #{@post}"
        # Upon trying to save post does validation check.  If false displays an alert.
        if @post.save!
            redirect_to city_post_path(city, @post)
          else 
            flash.alert = "Place must be less than 200 characters and Content cannot be blank"
            redirect_to new_city_post_path
          end
        
    end

    def edit
        # Brings in post and city information for edit form
        @user = current_user.id
        @post = Post.find(params[:id])
        @city = City.find(params[:city_id])
    end

    def update
        @user = current_user.id
        # Brings in post information to update
        @post = city.posts.find(params[:id])
        @post.user_id = @user
        # Checks validity of edited informatin.  If false displays an alert.
        if @post.update(post_params)
            redirect_to city_post_path(city, @post)
          else 
            flash.alert = "Place must be less than 200 characters and Content cannot be blank"
            redirect_to edit_city_post_path
          end
    end

    def destroy
        # Finds the post that was selected to delete and destroys it
        @user = current_user.id
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
