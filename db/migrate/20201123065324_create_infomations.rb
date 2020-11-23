class CreateInfomations < ActiveRecord::Migration[5.2]
  def change
    create_table :infomations do |t|
      t.integer :infomation_id
      t.string :text
      t.text :image_url

      t.timestamps
    end
  end
end
