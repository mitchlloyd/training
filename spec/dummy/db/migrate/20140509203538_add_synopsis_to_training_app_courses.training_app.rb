# This migration comes from training_app (originally 20130819151023)
class AddSynopsisToTrainingAppCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :synopsis, :text
  end
end
