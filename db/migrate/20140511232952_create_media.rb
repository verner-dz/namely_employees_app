class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.belongs_to :note
      t.string :title
      t.string :url
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
