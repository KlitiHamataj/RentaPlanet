class ChangeGuestsToBigintInPlanets < ActiveRecord::Migration[6.0]
  def change
    change_column :planets, :number_guests, :bigint
  end
end
