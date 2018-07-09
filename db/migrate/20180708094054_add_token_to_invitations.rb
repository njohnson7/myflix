class AddTokenToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :token, :string
  end
end
