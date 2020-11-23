class AddIndexColumnToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_index :favorites,[:user_id,:infomation_id], :unique => true
  end
end
