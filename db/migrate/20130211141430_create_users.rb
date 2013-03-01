class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :admin
      t.boolean :employee
      t.boolean :student
      t.string :hashed_password
      t.string :salt
      t.string :reset_password_code_untill

      t.timestamps
    end
  end
end
