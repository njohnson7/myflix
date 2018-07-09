class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.integer :inviter_id
      t.string  :recipient_name, :recipient_email
      t.text    :message
      t.timestamps
    end
  end
end
