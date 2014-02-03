class StaticPagesController < ApplicationController
  def home
  	# @cocktail = current_user.cocktails.build if signed_in?
  	redirect_to user_path(current_user) if signed_in?
  end

  def help
  end

  def about
  end
end
