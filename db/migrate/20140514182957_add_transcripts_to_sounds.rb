class AddTranscriptsToSounds < ActiveRecord::Migration
  def change
    change_table :sounds do |t|
      t.string :transcript
    end
  end
end
