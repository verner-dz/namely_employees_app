class AddAndRemoveAttributesToNote < ActiveRecord::Migration
  def change
    change_table :notes do |t|
      t.remove_references :note_tag
      t.references :user
      t.references :media
    end
  end
end
