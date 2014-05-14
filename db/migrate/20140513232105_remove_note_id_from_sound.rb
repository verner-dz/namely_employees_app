class RemoveNoteIdFromSound < ActiveRecord::Migration
  def change
    change_table :sounds do |t|
      t.remove_references :note
    end
  end
end
