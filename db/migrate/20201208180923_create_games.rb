class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|

      t.string :category
      t.integer :difficulty
      t.belongs_to :player1
      t.belongs_to :player2
      t.integer :player_started_id
      t.integer :winner_id

      t.timestamps
    end
  end
end
