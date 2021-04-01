class Spell < ActiveRecord::Base
    has_many :userspells
    has_many :users, through: :userspells

    def self.list_of_spell_names
        Spell.all.map { |spell| spell.name }
    end 
    
    def self.get_spell_info(spell_name)
        # get the spell data from the spells table
        Spell.find_by(name: spell_name)
    end 
end