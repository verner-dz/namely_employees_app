class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.text :url
      t.string :title
      t.text :ocrtext
    end
  end
end
