# This migration comes from training_app (originally 20130815201709)
class AddImageUrlToTrainingAppCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :image_url, :string
  end
end
