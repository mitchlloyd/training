# This migration comes from training_app (originally 20130918201556)
class CreateSections < ActiveRecord::Migration
  def change
    create_table :training_app_sections do |t|
      t.string :title
      t.references :course
    end
  end
end
