class AddAttributesToMedia < ActiveRecord::Migration
  def change
    change_table :media do |t|
      t.references :user
    end
  end
end
