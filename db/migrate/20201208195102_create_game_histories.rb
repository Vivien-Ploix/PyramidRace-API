class CreateGameHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :game_histories do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.boolean :response_correct
      t.datetime :question_time
      t.datetime :response_time

      t.timestamps
    end
  end
end
