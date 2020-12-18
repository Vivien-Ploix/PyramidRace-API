class Game < ApplicationRecord
  belongs_to :player1, class_name: "User", foreign_key: :player1_id
  belongs_to :player2, class_name: "User", foreign_key: :player2_id
  has_many :game_histories
  has_many :users, through: :game_histories
end
