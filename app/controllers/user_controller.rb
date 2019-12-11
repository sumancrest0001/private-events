# frozen_string_literal: true

class UserController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.name} !"
      sign_in @user
      redirect_to @user
    else
      flash.now[:danger] = 'invalid inputs'
      render 'new'
    end
  end

  def show
    current_user
    @upcoming_events = @current_user.upcoming_events
    @prev_events = @current_user.previous_events
    @user_relationships = @current_user.relationships
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
