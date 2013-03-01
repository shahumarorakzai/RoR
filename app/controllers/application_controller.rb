class ApplicationController < ActionController::Base
  
  helper :all 
  protect_from_forgery
  before_filter {|c| Authorization.current_user = c.current_user}

  def current_user
    Users.find(session[:user_id]) unless session[:user_id].nil?
  end
  def login_required
  	redirect_to '/' unless session[:user_id]
  end

end
