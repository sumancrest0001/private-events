# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user
      sign_in @user
      flash[:success] = 'Welcome!'
      redirect_to @user
    else
      flash.now[:danger] = 'Invalid data'
      render 'new'
    end
  end

  def destroy
    sign_out
    @current_user = nil
    redirect_to root_path
  end
end
