require 'spec_helper'

feature "Experiencing an online course", js: true do
  let(:course) { FactoryGirl.create(:course, title: "Test Course") }
  let(:registration) { FactoryGirl.create(:registration, course: course, code: "123") }
  let(:classroom_page) { ClassroomPage.new }

  describe "viewing a course" do
    context "with a valid code" do
      scenario "isn't in demo mode" do
        classroom_page.visit_course(course, registration.code)
        expect(classroom_page).to_not be_showing_demo
      end
    end

    context "with an invalid code" do
      scenario "is in demo mode" do
        classroom_page.visit_course(course, "invalid_code")
        expect(classroom_page).to be_showing_demo
      end
    end

    context "with a code from another course" do
      let(:other_course) { create(:course, title: "Other Course") }
      let!(:other_registration) { create(:registration, course: other_course, code: "othercode") }

      scenario "is in demo mode" do
        classroom_page.visit_course(course, "othercode")
        expect(classroom_page).to be_showing_demo
      end
    end
  end

  describe "sidebar navigation" do
    let(:section) { FactoryGirl.create(:section, course: course) }

    describe "unrelated chapters" do
      let!(:chapter) { FactoryGirl.create(:chapter, title: "Test Chapter", section: section) }
      let!(:unrelated_chapter) { FactoryGirl.create(:chapter, title: "Another Chapter") }

      scenario "should not be visible" do
        classroom_page.visit_course(course, registration.code)
        eventually do
          expect(classroom_page.chapter_titles).to eq(["Test Chapter"])
        end
      end
    end

    describe "section ordering" do
      let!(:section3) { FactoryGirl.create(:section, title: "Three", sort_order: nil, course: course) }
      let!(:section2) { FactoryGirl.create(:section, title: "Two", sort_order: 2, course: course) }
      let!(:section1) { FactoryGirl.create(:section, title: "One", sort_order: 1, course: course) }
      let!(:chapter) { FactoryGirl.create(:chapter, title: "Test Chapter", section: section1) }
      scenario "should be ordered by the order property" do
        classroom_page.visit_course(course, registration.code)
        eventually do
          expect(classroom_page.sections).to eq(["One", "Two", "Three"])
        end
      end
    end

    describe "chapter ordering" do
      before do
        FactoryGirl.create(:chapter, title: "Three", sort_order: nil, section: section)
        FactoryGirl.create(:chapter, title: "Two", sort_order: 2, section: section)
        FactoryGirl.create(:chapter, title: "One", sort_order: 1, section: section)
      end

      scenario "should be ordered by the order property" do
        classroom_page.visit_course(course, registration.code)
        eventually do
          expect(classroom_page.chapter_titles).to eq(["One", "Two", "Three"])
        end
      end
    end
  end

  describe "course introduction" do
    let(:course_introduction) { "## Test Introduction" }
    let!(:course) { FactoryGirl.create(:course, introduction: course_introduction) }

    scenario "converts markdown to html" do
      classroom_page.visit_course(course)
      expect(classroom_page.course_introduction).to eq("Test Introduction")
    end
  end

  describe "chapter description" do
    let(:chapter_description) { "## Test Description" }
    let(:section) { FactoryGirl.create(:section, course: course) }
    let!(:chapter) { FactoryGirl.create(:chapter, description: chapter_description, section: section, demo: true) }

    scenario "converts markdown to html" do
      classroom_page.visit_course(course)
      classroom_page.visit_chapter(chapter)

      eventually do
        expect(classroom_page.chapter_description).to eq("Test Description")
      end
    end
  end
end
