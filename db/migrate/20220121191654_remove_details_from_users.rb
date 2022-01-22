class RemoveDetailsFromUsers < ActiveRecord::Migration[7.0]
  def change
    ## Confirmable
    remove_columns(:users, :confirmation_token, :confirmed_at, :confirmation_sent_at, :unconfirmed_email)
  end
end
