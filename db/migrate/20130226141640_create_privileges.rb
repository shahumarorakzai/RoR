class CreatePrivileges < ActiveRecord::Migration
  def change
    create_table :privileges do |t|

      t.timestamps
    end
  end
end
