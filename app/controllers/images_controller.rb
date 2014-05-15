class ImagesController < ApplicationController

  def new
  @user = current_user
  @image = Image.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = Image.create(title: params['image']['title'], url: params['image']['url'])
  end


end
