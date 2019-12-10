class UserController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user} !"
      sign_in @user
      redirect_to @user
    else
      flash.now[:danger] = "invalid inputs"
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @upcoming_events = @current_user.upcoming_events
    @prev_events = @current_user.prev_events
    @user_relationships = @user.relationships
  end

  def destroy
    sign_out
    @current_user = nil
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
