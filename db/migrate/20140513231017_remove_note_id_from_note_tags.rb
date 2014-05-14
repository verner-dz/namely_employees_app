class RemoveNoteIdFromNoteTags < ActiveRecord::Migration
  def change
    change_table :note_tags do |t|
      t.remove_references :note
      t.references :user
      t.references :sound
    end
  end
end
