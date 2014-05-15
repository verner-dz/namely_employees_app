class NoteTag < ActiveRecord::Base
  belongs_to :sound
  belongs_to :user
end
