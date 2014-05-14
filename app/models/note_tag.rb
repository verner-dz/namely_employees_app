class NoteTag < ActiveRecord::Base
  belongs_to :sound
  belongs_to :user

  def create
    # thisnote = Note.find(params[:note_id])
    # thisnote.note_tags.create(bunch_of_params)

    # respond with note_tag rendered as json

    respond_to do |format|
      format.html { }
      format.json { render json: @note_tag.to_json}

    end
  end
end
