class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|

      t.integer :category
      t.string :difficulty
      t.belongs_to :player1
      t.belongs_to :player2
      t.string :turn
      t.integer :winner_id

      t.timestamps
    end
  end
end
