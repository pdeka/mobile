class InitialData < ActiveRecord::Migration

  def self.up
    dimension = Dimension.new
    dimension.name = 'Irritability'
    dimension.description = 'How would you rate your irritability on a scale of 1 to 10?'

    dimension.save!

    user = User.new
    user.usernumber = 'josh'
    user.password = 'josh'
    user.dimensions << dimension

    user.save!

  end

  def self.down
    User.delete_all
    Dimension.delete_all
  end
end
