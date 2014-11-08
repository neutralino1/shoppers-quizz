class UsersController < ApplicationController

  # THIS SHOULD ONY BE ALLOWED TO ADMINS

  def show
    @user = User.find(params[:id])
  end

end