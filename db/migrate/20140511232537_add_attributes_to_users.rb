class AddAttributesToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :media
      t.references :note
    end
  end
end
