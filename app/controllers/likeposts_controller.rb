class LikepostsController < ApplicationController
    before_action :find_post

    def likepost_params
        params.require(:likepost).permit(:user_id, :post_id);
    end

    def create
        current_user.likeapost(@post)
        redirect_to @post
    end

    def destroy
        current_user.unlikeapost(@post)
        redirect_to @post
    end

    private
    
    def find_post
        @post = Post.find(params[:id]);
    end
end
