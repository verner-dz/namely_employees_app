class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:welcome, :new, :create, :show]

  def welcome
  end

  def index
   # @users = User.all_except(current_user)
  end

  def show
  end
end
