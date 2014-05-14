class SoundsController < ApplicationController


  def new
    # @sound = Sound.new
    # # binding.pry
    # @sound.user_id = current_user.id
  end

  def create
    @sound = Sound.new(title: params['sound']['title'], url: params['sound']['url'])
    @sound.user_id = current_user.id
    @sound.save
    # binding.pry

    respond_to do |format|
      format.html { render nothing: true}
      format.json { render json: @sound.to_json}
    end
  end


end





