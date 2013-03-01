class Course < ActiveRecord::Base
  set_table_name 'courses'
  set_primary_key :id
  #validates :course_name, :presence => true
  #validates :code, presence => true
  validates_presence_of :course_name, :code
  validate :presence_of_initial_batch, :on => :create
  has_many :batches, :foreign_key => 'course_id'
  accepts_nested_attributes_for :batches
  scope :active, :conditions => {:is_deleted => false}, :order => "course_name asc" 
  def presence_of_initial_batch
    errors.add[:add, "Should Have initial batch"] if batches.lenght==0
  end
end
