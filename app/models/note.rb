class Note < ActiveRecord::Base
    has_many :note_tags
    belongs_to :user
end
