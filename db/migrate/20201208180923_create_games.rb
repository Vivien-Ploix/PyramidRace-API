class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|

      t.integer :category, null: false, default: 9
      t.string :difficulty, null: false, default: "medium"
      t.belongs_to :player1
      t.belongs_to :player2
      t.string :turn, null: false, default: "player1"
      t.integer :winner_id

      t.timestamps
    end
  end
end
