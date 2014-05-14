class ChangeMediatoSoundInNote < ActiveRecord::Migration
  def change
    change_table :notes do |t|
      t.remove_references :media
      t.references :sound
    end
  end
end
