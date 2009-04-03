class InitialData < ActiveRecord::Migration

  def self.up
    dimension_one = Dimension.new
    dimension_one.name = 'Irritability'
    dimension_one.description = 'How would you rate your irritability on a scale of 1 to 5?'
    dimension_one.save!

    dimension_two = Dimension.new
    dimension_two.name = 'Anxiety'
    dimension_two.description = 'How would you rate your anxiety on a scale of 1 to 5?'
    dimension_two.save!

    user = User.new
    user.usernumber = '1234'
    user.password = '1234'
    user.dimensions << [dimension_one, dimension_two]

    user.save!

  end

  def self.down
    User.delete_all
    Dimension.delete_all
  end
end
