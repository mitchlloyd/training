# This migration comes from training_app (originally 20140212033154)
class AddDiscountCodeToRegistrations < ActiveRecord::Migration
  def change
    add_column :training_app_registrations, :discount_code_id, :integer
  end
end

