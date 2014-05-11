class CreateNoteTags < ActiveRecord::Migration
  def change
    create_table :note_tags do |t|
      t.text :content
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
