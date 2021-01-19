class ChangePriceToBigintInPlanets < ActiveRecord::Migration[6.0]
  def change
    change_column :planets, :price, :bigint
  end
end
