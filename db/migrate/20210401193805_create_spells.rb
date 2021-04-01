class CreateSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :spells do |t|
      t.string(:name)
      t.string(:type)
      t.string(:incantation)
      t.string(:description)
    end
  end
end
