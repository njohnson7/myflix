class RenameColumnsInRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_column :relationships, :user_id, :leader_id
  end
end
