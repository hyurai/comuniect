class AddLikeEntertainerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users,:like_entertaier,:string
    add_column :users,:nickname,:string
  end
end
