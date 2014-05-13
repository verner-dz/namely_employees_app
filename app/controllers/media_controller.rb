class MediaController < ApplicationController

  def create
    @media = Media.new
    # binding.pry
    @media.user_id = current_user.id


  end


end





