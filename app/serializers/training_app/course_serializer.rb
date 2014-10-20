module TrainingApp
  class CourseSerializer < ActiveModel::Serializer
    attributes :id, :title, :introduction, :price

    has_many :sections
    embed :ids, include: true

    def attributes
      attrs = super
      if CoursePolicy.new(registration, object).restricted_to_demo?
        attrs[:demo] = true
      end
      attrs
    end
  end
end
