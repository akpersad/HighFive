class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
    	t.integer :zipcode
    	

      t.timestamps null: false
    end
  end
end
