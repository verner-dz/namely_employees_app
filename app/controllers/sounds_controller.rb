class SoundsController < ApplicationController

  def create
    @sound = Sound.new
    # binding.pry
    @sound.user_id = current_user.id


  end


end





