# This migration comes from training_app (originally 20130913193005)
class RenameGravatarEmailToImageUrl < ActiveRecord::Migration
  def change
    rename_column :training_app_instructors, :gravatar_email, :image_url
  end
end
