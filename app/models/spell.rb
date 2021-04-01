class Spell < ActiveRecord::Base
    has_many :userspells
    has_many :users, through: :userspells
end