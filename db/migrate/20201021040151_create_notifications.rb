class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.references :notifying, foreign_key: { to_table: :users }
      t.references :notified_by, foreign_key: { to_table: :users }
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
