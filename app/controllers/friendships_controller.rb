class FriendshipsController < ApplicationController

    before_action :find_user

    def friendship_params
        params.require(:friendship).permit(:follower_id, :followed_id);
    end

    def create
        current_user.follow(@user)
        redirect_to @user
    end

    def destroy
        current_user.unfollow(@user)
        redirect_to @user
    end

    private
    
    def find_user
        @user = User.find(params[:id]);
    end

end
