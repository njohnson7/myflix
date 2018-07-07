class RenameFollowersToRelationships < ActiveRecord::Migration[5.2]
  def change
    rename_table :followings, :relationships
  end
end
