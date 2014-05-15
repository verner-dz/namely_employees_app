class AddLanguageToImages < ActiveRecord::Migration
  def change
    change_table :images do |t|
      t.string :language
    end
  end
end
