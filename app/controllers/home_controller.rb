class HomeController < ApplicationController

  def index
  end

  def login
    cookies[:email] = params[:email]
    User.where(email: params[:email]).first_or_create
    redirect_to root_path
  end

  def logout
    cookies[:email] = nil
    redirect_to root_path
  end

end