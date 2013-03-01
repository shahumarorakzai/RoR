authorization do
  role :admin do
    has_permission_on :courses, :to => [:index, :manage_course, :edit, :show, :new]
  end
end
