# This migration comes from training_app (originally 20130927175959)
class AddActiveToCourses < ActiveRecord::Migration
  def change
    add_column :training_app_courses, :active, :boolean, default: true
  end
end
