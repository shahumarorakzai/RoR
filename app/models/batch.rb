class Batch < ActiveRecord::Base
 
  belongs_to :course, :primary_key => "id", :foreign_key => "course_id" 
end
