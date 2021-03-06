class SessionsController < ApplicationController
	def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
  		redirect_back_or user
  	else
  		#error message and re render sign in form
  		flash.now[:error] = "barbot cannot comfirm your identity"
  		render 'new'
  	end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
