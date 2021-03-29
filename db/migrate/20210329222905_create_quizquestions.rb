class CreateQuizquestions < ActiveRecord::Migration[5.2]
  def change
    create_table :quizquestions do |t|
      t.string(:question)
      t.string(:response_option)
      t.integer(:house_id)
    end
  end
end
