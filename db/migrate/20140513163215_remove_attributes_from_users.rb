class RemoveAttributesFromUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove_references :media
      t.remove_references :note
    end
  end
end
