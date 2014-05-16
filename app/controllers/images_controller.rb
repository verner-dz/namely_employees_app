class ImagesController < ApplicationController

  def new
  @user = current_user
  @image = Image.new
  end

  def create
    @user = User.find(params[:user_id])
    @image = Image.create(title: params['image']['title'], url: params['image']['url'])
    response = Image.ocr_req(params['image']['url'])
    @image.ocrtext = response.body
    @image.save
    # binding.pry
    p "====================="
    #p response.ocrtext
    p  @image.ocrtext
    p "====================="

  redirect_to image_path @image
  end

  def show
    @image = Image.find(params[:id])
  end


end
