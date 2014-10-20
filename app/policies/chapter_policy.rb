class ChapterPolicy
  def initialize(registration, chapter)
    @registration, @chapter = registration, chapter
  end

  def view_content?
    return true if @chapter.demo?
    @registration.present? && @registration.course == @chapter.course
  end
end
