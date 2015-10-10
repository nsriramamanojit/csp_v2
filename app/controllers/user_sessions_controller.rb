class UserSessionsController < ApplicationController
  before_filter :require_user, :only => :destroy
  layout false


  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = 'Howdy! Login successful!'
      redirect_back_or_default dashboard_index_path
    else
      flash[:alert] = 'Please Verify Email or Password.'
      redirect_back_or_default root_url
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = 'Logout successful!'
    redirect_back_or_default new_user_session_url
  end
end
