class UsersController < ApplicationController

    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, 
        :name, :designation, :about);
    end

    def new
        @user = User.new;
    end

    def show
        
        @user = User.find(params[:id]);

    end

    def edit
        @user = User.find(params[:id]);
    end

    def update
        @user = User.find(params[:id]);
    
        if(@user.update(user_params))
            redirect_to posts_path;
        else
            render 'edit';
        end
    end

    def create
        @user = User.new(user_params);
        if @user.save
            redirect_to login_path, notice: "Thank you for signing up!!";
        else
            render "new"
        end
    end

    def create
        @user = User.new(user_params);
        if @user.save
            redirect_to login_path, notice: "Thank you for signing up!!";
        else
            render "new"
        end
    end

    def showfollowers
        @user = User.find_by_email(params[:email]);
        @followers = @user.followers;
    end

    def showfollowing
        @user = User.find_by_email(params[:email]);
        @following = @user.following;
    end

end
