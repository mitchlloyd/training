# This migration comes from training_app (originally 20140208192912)
class AddLatLongToVenues < ActiveRecord::Migration
  def change
    add_column :training_app_venues, :latitude, :float
    add_column :training_app_venues, :longitude, :string
  end
end
