class AddAgeToInfomations < ActiveRecord::Migration[5.2]
  def change
    add_column :infomations,:age,:integer
  end
end
