class CreateUserspells < ActiveRecord::Migration[5.2]
  def change
    create_table :userspells do |t|
      t.integer(:user_id)
      t.integer(:spell_id)
    end
  end
end
