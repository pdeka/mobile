class CreateUserRatings < ActiveRecord::Migration
  def self.up
    create_table :user_ratings do |t|
      t.integer :rating

      t.integer :reference_number
      t.string :channel

      t.column :user_id, :integer
      t.column :dimension_id, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :user_ratings
  end
end
