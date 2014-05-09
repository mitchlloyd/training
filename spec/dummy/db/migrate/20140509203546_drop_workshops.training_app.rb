# This migration comes from training_app (originally 20130920201906)
class DropWorkshops < ActiveRecord::Migration
  def change
    drop_table :training_app_workshops
  end
end
