class User < ActiveRecord::Base
  has_many :sounds
  has_many :note_tags
  has_many :images
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
