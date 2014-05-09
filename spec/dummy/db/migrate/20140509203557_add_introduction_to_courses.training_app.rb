# This migration comes from training_app (originally 20131121164419)
class AddIntroductionToCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :introduction, :text
  end
end
