# This migration comes from training_app (originally 20131104161823)
class ChangeChapterDescriptionToText < ActiveRecord::Migration
  def change
    change_column :training_app_chapters, :description, :text
  end
end
