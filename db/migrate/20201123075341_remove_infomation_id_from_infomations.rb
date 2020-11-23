class RemoveInfomationIdFromInfomations < ActiveRecord::Migration[5.2]
  def change
    remove_column :infomations,:infomation_id,:integer
  end
end
