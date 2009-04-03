class CreateSituationalDatas < ActiveRecord::Migration
  def self.up
    create_table :situational_datas do |t|
      t.string :location
      t.text :accompanying_people
      t.text :significant_occurences

      t.column :rating_session_id, :integer
    end
  end

  def self.down
    drop_table :situational_datas
  end
end
