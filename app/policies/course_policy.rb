class CoursePolicy
  def initialize(registration, course)
    @registration, @course = registration, course
  end

  def restricted_to_demo?
    @registration.nil? || @registration.course != @course
  end
end

