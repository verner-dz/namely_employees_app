class Sound < ActiveRecord::Base
  # string_attr :title
  belongs_to  :user
  has_many    :note_tags

end
