class ChangeIntToBigIntNoteTag < ActiveRecord::Migration
  def change
    change_column :note_tags, :created_epoch, 'bigint USING CAST(created_epoch AS bigint)'
  end
end


