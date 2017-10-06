class Admin::PostsController < Admin::BaseController
  before_action :fetch_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page]).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.soft_delete!
    redirect_to admin_posts_path
  end

  private
  def fetch_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :published)
  end
end
