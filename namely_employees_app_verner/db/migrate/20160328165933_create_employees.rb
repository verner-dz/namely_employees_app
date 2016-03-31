class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_status
      t.string :job_title

      t.timestamps null: false
    end
  end
end
