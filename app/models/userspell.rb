class Userspell < ActiveRecord::Base
    belongs_to :spell
    belongs_to :user
end