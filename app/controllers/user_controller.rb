class UserController < ApplicationController
	layout :choose_layout
	before_filter :login_required, :except => [:login]
	

	def choose_layout
		return 'login' if action_name == 'login'
		return 'dashboard' if action_name == 'dashboard'
		'application'
	end
	def all
		@users = Users.all
	end
	
	def login
		@institute = Configurations.find_by_config_key("LogoName")
		if request.post? and params[:users]
			@user = Users.new(params[:users])
			user = Users.find_by_username @user.username
			if user and Users.authenticate?(@user.username, @user.password)
				session[:user_id] = user.id
				flash[:notice] = "Welcome #{user.first_name} #{user.last_name}"
				redirect_to :controller =>'user', :action => 'dashboard'
			else
				
				flash[:notice] = "invalid username"
			end
		end
	end

	def dashboard
	   @user = current_user
	   @config = Configurations.available_modules
	 #  @employee = @user.employee_record if ["employee", "admin"].include?(@user.role_name.downcase)
	   @student = @user.student_record if @user.role_name.downcase == 'student'
	   #@news = News.find(:all :limit=>5)
	end
	def logout
		session[:user_id] = nil
		flash[:notice] = "Logout Successful"
		redirect_to :controller => "user", :action => "login"
	end

end
