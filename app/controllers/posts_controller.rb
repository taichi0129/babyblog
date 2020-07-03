class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    # @user = User.find_by(id: @post.user_id)
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to post_path(@post.id)
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  private
  def post_params
    params.require(:post).permit(:title, :text, :image, { tag_ids: [] }).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
