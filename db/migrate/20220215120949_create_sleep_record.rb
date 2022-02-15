class CreateSleepRecord < ActiveRecord::Migration[6.0]
  def change
    create_table :sleep_records do |t|
      t.timestamps
      t.integer :status, default: 0, index: true
      t.datetime :completed_at
      t.references :user, index: true, null: false, foreign_key: { to_table: :users }
    end
  end
end
