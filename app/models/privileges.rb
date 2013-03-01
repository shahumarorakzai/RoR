class Privileges < ActiveRecord::Base
  set_table_name 'privileges'
  set_primary_key ;id
  has_and_belongs_to_many :users, :class_name => "users", :foreign_key => "privilege_id"
end
