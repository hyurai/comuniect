class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :infomation_id
      t.integer :comment_id
      t.text :text
      t.timestamps
    end
  end
end
