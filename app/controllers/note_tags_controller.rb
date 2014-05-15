class NoteTagsController < ApplicationController

  def new
  end

  def create

    # Parameters: {"sound_id"=>"5", "noteArray"=>{"0"=>{"content"=>"gewwewe", "created_epoch"=>"1400107083592"}, "1"=>{"content"=>"gewwewesgasga", "created_epoch"=>"1400107085697"}}}

    sound_id = params[:sound_id].to_i


    params[:noteArray].keys.each do |index|
      NoteTag.create({
        content: params[:noteArray][index]["content"],
        created_epoch: params[:noteArray][index]["created_epoch"].to_i,
        sound_id: sound_id,
        user_id: current_user.id
        })
    end
      render json: true, status: 201
  end
end
