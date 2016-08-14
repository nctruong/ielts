class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.string :password
      t.string :sex
      t.string :phone
      t.string :email
      t.string :avatar
      t.datetime :joined_date
      t.integer :student_level
      t.string :first_name
      t.string :last_name
      t.datetime :birthday
      t.string :country

      t.timestamps null: false
    end
  end
end
