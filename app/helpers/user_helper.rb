module UserHelper
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
end
