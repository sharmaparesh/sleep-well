class CreateUserFollow < ActiveRecord::Migration[6.0]
  def change
    create_table :user_follows do |t|
      t.timestamps
      t.references :user, index: true, null: false, foreign_key: { to_table: :users }
      t.references :follower, index: true, null: false, foreign_key: { to_table: :users }
    end
  end
end
