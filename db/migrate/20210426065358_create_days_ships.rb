class CreateDaysShips < ActiveRecord::Migration[6.0]
  def change
    create_table :days_ships do |t|

      t.timestamps
    end
  end
end
