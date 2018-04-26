class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def cart
    # value = cookies[:cart] || JSON.generate({})
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end

  helper_method :cart

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now,
    }
    cookies[:cart]
  end

  def current_user
    if @current_user
      return true
    elsif session[:user_id] && session[:user_id] > 0
      if User.where(id: session[:user_id]) != []
        return true
      else
        return false
      end
    else
      return false
    end
  end

  helper_method :current_user

  def authorize
    redirect_to "/login" unless current_user
  end
end
