class PostsController < ApplicationController
  before_action :require_login
  before_action :admin_check, only:[:new,:create,:edit,:update,:destroy]

  def index
    @posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def likes
    @posts=Post.all
  end

  private

    def post_params
      params.require(:post).permit(:title,:content,:image)
    end
end
