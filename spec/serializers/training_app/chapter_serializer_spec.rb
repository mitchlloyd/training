require 'spec_helper'

module TrainingApp
  describe ChapterSerializer do
    let(:course) { create(:course) }
    let(:registration) { FactoryGirl.create(:registration, course: course) }
    let(:section) { create(:section, course: course) }
    let(:chapter) { FactoryGirl.create(:chapter, section: section, video_url: "test", code_url: "jsbin.com")}
    let(:demo_chapter) { FactoryGirl.create(:chapter, section: section, video_url: "test", code_url: "jsbin.com", demo: true)}

    context "with a registration" do
      let(:serializer){ ChapterSerializer.new(chapter, scope: registration, scope_name: "registration") }
      it "should include urls" do
        expect(serializer.attributes[:video_url]).to be_present
      end
    end

    context "without a registration" do
      let(:serializer){ ChapterSerializer.new(chapter, scope: nil, scope_name: "registration") }
      it "should remove urls" do
        expect(serializer.attributes[:video_url]).to be_blank
        expect(serializer.attributes[:description]).to be_blank
      end
    end

    context "with a registration from another course" do
      let(:other_course) { create(:course) }
      let!(:other_registration) { create(:registration, course: other_course) }
      let(:serializer){ ChapterSerializer.new(chapter, scope: other_registration, scope_name: "registration") }

      it "should remove urls" do
        expect(serializer.attributes[:video_url]).to be_blank
        expect(serializer.attributes[:description]).to be_blank
      end
    end

    context "when demo" do
      let(:serializer){ ChapterSerializer.new(demo_chapter, scope: nil, scope_name: "registration") }
      it "should include urls" do
        expect(serializer.attributes[:video_url]).to be_present
      end
    end
  end
end
