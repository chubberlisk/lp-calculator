class CreateDuels < ActiveRecord::Migration[5.2]
  def change
    create_table :duels do |t|
      t.integer :status, null: false, default: 0
      t.integer :starting_lp, null: false
      t.integer :player_one_lp
      t.integer :player_two_lp
      t.timestamps
      t.datetime :ended_at
    end
    add_reference :duels, :player_one, null: false
    add_reference :duels, :player_two, null: false
  end
end
