class Admin::UsersController < Admin::BaseController
  before_action :fetch_user, only: [:edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page]).order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.soft_delete!
    redirect_to admin_users_path
  end

  private
  def fetch_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
