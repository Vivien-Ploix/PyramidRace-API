class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :player1_games, class_name: "Game", foreign_key: :player1_id
  has_many :player2_games, class_name: "Game", foreign_key: :player2_id
  has_many :game_histories
  has_many :games, through: :game_histories

  validates :pseudo, presence: true
  validates_length_of :pseudo, :minimum => 3

end