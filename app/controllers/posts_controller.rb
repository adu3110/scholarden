class PostsController < ApplicationController
    def index
        if params[:tag]
            @posts = Post.tagged_with(params[:tag])
        elsif 
            @posts = Post.search(params[:search])
        else
            @posts = Post.all;
        end

    end

    def show
        
        @post = Post.find(params[:id]);

    end

    def new
        
        if session[:user_id]
            @post = Post.new;
        else
            redirect_to new_session_path
        end        
    end

    def create

        @post = Post.new(post_params);


        if(@post.save)
            redirect_to @post;
        else
            render 'new';
        end
    end

    def edit
        @post = Post.find(params[:id]);
    end

    def update
        @post = Post.find(params[:id]);

        if(@post.update(post_params))
            redirect_to @post;
        else
            render 'edit';
        end
    end

    def destroy
        @post = Post.find(params[:id]);
        @post.destroy

        redirect_to posts_path
    end

    private def post_params
        params.require(:post).permit(:title, :body, :author, :tag_list);
    end

end
