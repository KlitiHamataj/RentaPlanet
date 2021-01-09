class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :price
      t.integer :number_guests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
