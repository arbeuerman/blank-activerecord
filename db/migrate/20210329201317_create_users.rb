class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string(:name)
      t.string(:username)
      t.string(:password)
      t.integer(:house_id)
    end 
  end
end
