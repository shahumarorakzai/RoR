module CoursesHelper
  def course_setup(course)
    course.tap do |c|
      c.batches.build if c.batches.empty?
    end
  end
end
