# This migration comes from training_app (originally 20130924143239)
class RemoveOldDescriptionFields < ActiveRecord::Migration
  def change
    remove_column :training_app_courses, :description_close
  end
end
