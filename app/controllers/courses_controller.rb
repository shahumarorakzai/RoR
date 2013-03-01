class CoursesController < ApplicationController
  filter_access_to :all
  def index
    @courses = Course.active
  end
  def manage_course
    @courses = Course.active
  end
  def edit
    @courses = Course.find(params[:id])
  end
  def new
    @courses = Course.new
    3.times {@courses.batches.build}
  end
  def show
  end
end
