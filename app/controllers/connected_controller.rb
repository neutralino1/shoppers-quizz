class ConnectedController < ApplicationController

  before_action :check_logged_in

  protected

  def check_logged_in
    redirect_to root_path unless @current_user
  end
end