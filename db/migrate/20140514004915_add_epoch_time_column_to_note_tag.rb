class AddEpochTimeColumnToNoteTag < ActiveRecord::Migration
  def change
    change_table :note_tags do |t|
      t.integer :created_epoch
    end
  end
end
