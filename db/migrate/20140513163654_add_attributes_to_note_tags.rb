class AddAttributesToNoteTags < ActiveRecord::Migration
  def change
    change_table :note_tags do |t|
      t.references :note
    end
  end
end
