class CreateUserDimensionsMapping < ActiveRecord::Migration
  def self.up
    create_table :dimensions_users do |t|
      t.column :user_id, :integer
      t.column :dimension_id, :integer
    end

  end

  def self.down
    drop_table :dimensions_users
  end
end