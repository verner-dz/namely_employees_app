class RenameMediaToSounds < ActiveRecord::Migration
  def change
     rename_table :media, :sounds
  end
end
