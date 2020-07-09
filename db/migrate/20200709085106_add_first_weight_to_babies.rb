class AddFirstWeightToBabies < ActiveRecord::Migration[5.2]
  def change
    add_column :babies, :first_weight, :integer
    add_column :babies, :first_height, :integer
  end
end
