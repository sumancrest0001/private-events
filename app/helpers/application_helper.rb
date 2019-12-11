# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Private Events Project'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    session[:user_id] = user.id
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_digest
  end

  def sign_out
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    session.delete(:user_id)
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end
end
