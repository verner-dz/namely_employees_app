class Sound < ActiveRecord::Base
  # string_attr :title
  belongs_to  :user
  belongs_to  :note

end
