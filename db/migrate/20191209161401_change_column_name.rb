class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :events, :user_id, :creator_id
  end
end
