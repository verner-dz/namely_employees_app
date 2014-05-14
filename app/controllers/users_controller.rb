class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:welcome, :new, :create, :show]



  def welcome
    @user = current_user.id
    # params.inspect
    binding.pry
   # current_user = User.find(params[:id])
  end


end
