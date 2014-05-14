class UsersController < ApplicationController
  before_action :authenticate_user!, except: [ :new, :create, :show]



  def welcome
  if current_user
    @user = current_user.id
  end
    # params.inspect
    # binding.pry
   # current_user = User.find(params[:id])
  end


end
