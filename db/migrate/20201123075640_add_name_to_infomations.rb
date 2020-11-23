class AddNameToInfomations < ActiveRecord::Migration[5.2]
  def change
    add_column :infomations,:name,:string
  end
end
