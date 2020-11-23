class RemoveTextFromInfomations < ActiveRecord::Migration[5.2]
  def change
    remove_column :infomations,:text,:string
  end
end
