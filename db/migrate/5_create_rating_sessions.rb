class CreateRatingSessions < ActiveRecord::Migration
  def self.up
    create_table :rating_sessions do |t|
      t.integer :reference_number
      t.string :channel

      t.column :user_id, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :rating_sessions
  end
end
