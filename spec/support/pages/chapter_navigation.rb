class ChapterNavigation
  include Capybara::DSL

  def navigate_to_chapter(chapter)
    within '.sidebar' do
      click_link(chapter.title)
    end
  end
end
