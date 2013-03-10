class UsersController < ApplicationController
  
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
  		# Handle a successful save.
      sign_in @user
      flash[:success] = "Welcome to the Jamitter!"
      redirect_to @user
  	else
  		# Render the login page again.
  		render 'new'
  	end
  end
end
