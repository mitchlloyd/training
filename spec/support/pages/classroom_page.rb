class ClassroomPage
  include Capybara::DSL

  def visit_course(course, code=nil)
    visit "/training/classroom/?code=#{code}#/courses/#{course.id}"
    # TODO: This needs to go
    find('.ember-application') # wait for ember to initialize
  end

  def visit_chapter(chapter, code=nil)
    visit "/training/classroom/?code=#{code}#/courses/#{chapter.course.id}/chapters/#{chapter.id}"
    # TODO: This needs to go
    find('.ember-application') # wait for ember to initialize
  end

  def title
    find('.info-bar__title').text
  end

  def theme_url
    find('.theme-link', visible: false)[:href]
  end

  def chapter_titles(count)
    has_css?('.subnav__item', count: count)
    all('.subnav__item', false).collect(&:text)
  end

  # TODO: Make private - This shouldn't be in the public API b/c it encourages people to write
  # flaky tests.
  def chapters
    all('.subnav__item', false).collect(&:text)
  end

  def disabled_chapters
    all(".subnav__item--disabled", visible: false).collect(&:text)
  end

  def sections
    all(".nav__heading__title", visible: false).collect(&:text)
  end

  def code_url
    find('iframe')[:src]
  end

  def course_introduction
    find('.course__intro').text
  end

  def chapter_description
    find('.chapter__description').text
  end

  def showing_purchase_modal?
    has_css?('.modal.modal--active')
  end

  def showing_demo?
    has_css?('.bar__notice--demo')
  end
end

