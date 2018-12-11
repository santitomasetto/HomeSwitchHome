class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def make_premium
  	@user=User.find(params[:id])
    if @user.premium
      @user.premium=false
    else
  	  @user.premium=true
    end
  	if @user.save
  		flash.notice = "El usuario ya es premium"
  		redirect_to users_index_path
  	else
  		flash.alarm = "ERROR al hacer usuario premium"
  		redirect_to users_index_path
  	end
  end
end
