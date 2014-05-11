class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.datetime :created_at
      t.datetime :updated_at
      t.references :note_tag, index: true
    end
  end
end
