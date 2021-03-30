class CreateUseranswers < ActiveRecord::Migration[5.2]
  def change
    create_table :useranswers do |t|
      t.integer(:question_id)
      t.integer(:user_id)
    end
  end
end
