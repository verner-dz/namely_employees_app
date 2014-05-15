class SoundsController < ApplicationController


  def new
    # @sound = Sound.new
    # # binding.pry
    # @sound.user_id = current_user.id
  end

  def create
    # "noteTags"=>{"0"=>{"content"=>"note at 4:58", "created_epoch"=>"1400101105113"}, "1"=>{"content"=>"second note at 4:58", "created_epoch"=>"1400101137112"}}
    @sound = Sound.new(title: params['sound']['title'], url: params['sound']['url'])
    @sound.user_id = current_user.id
    @sound.save
    # note_tags = params[:noteTags] # array of notes with attributes

    # call each on the array of notes
    # for each one:
      # get attributes out of "javascript object"
      # (might have to convert from json to a hash BUT I DONT THINK SO)
      # turn created_epoch into a ruby date object
      # create a new notetags and store them in @sound's notetags array
      # @sounds.note_tags.create()
    # binding.pry

    # note_tags.keys.each do |idx|
    #   Note_tag.create({
    #     content: note_tags[idx]['content']
    #     created_epoch: note_tags[idx]['created_epoch']
    #     })
    # end

    respond_to do |format|
      format.html { redirect_to @sound }
      format.json { render json: @sound.to_json}
    end
  end

  def show
    @sound = Sound.find(params[:id])
  end


end





