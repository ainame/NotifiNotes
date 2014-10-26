class CreateEndpoints < ActiveRecord::Migration
  def change
    create_table :endpoints do |t|
      t.integer :user_id
      t.integer :platform
      t.text :device_token
      t.string :arn

      t.timestamps
    end
  end
end
