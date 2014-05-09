# This migration comes from training_app (originally 20131212202421)
class CreateTrainingAppDiscountCodes < ActiveRecord::Migration
  def change
    create_table :training_app_discount_codes do |t|
      t.string :code
      t.integer :price
      t.references :course

      t.timestamps
    end
  end
end
