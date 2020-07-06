class CreateBabies < ActiveRecord::Migration[5.2]
  def change
    create_table :babies do |t|
      t.string :name, null: false
      t.string :sex, null: false
      t.string :image
      t.date :birthday, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
