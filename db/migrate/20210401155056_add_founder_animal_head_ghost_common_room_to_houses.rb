class AddFounderAnimalHeadGhostCommonRoomToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :founder, :string
    add_column :houses, :animal, :string
    add_column :houses, :head, :string
    add_column :houses, :ghost, :string
    add_column :houses, :commonroom, :string
  end
end
