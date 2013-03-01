class Users < ActiveRecord::Base
  attr_accessor :password, :role, :old_password, :new_password, :confirm_password


  has_one :student_record, :class_name => "student", :foreign_key => "user_id"
  has_one :employee_record, :class_name => "employee", :foreign_key => "user_id"
  has_and_belongs_to_many :privileges, :class_name => "privileges", :foreign_key => "id"


  def self.authenticate?(username, password)
    u = Users.find_by_username username
    u.hashed_password == password
  end


  def role_name
    return "admin" if self.admin?
    return "employee" if self.employee?
    return "student" if self.student?
    return nil
  end


  def role_symbols
    prv = []
   # @privileges_symbol ||= privileges.map { |privilege| prv << privilege.name.underscore.to_sym }
    if admin?
      return [:admin] + prv
    elseif employee?
      return [:employee] + prv
    elseif student?
      return [:student]
    else
      return prv
    end 
  end

end
