class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
    	t.integer :zipcode
    	t.integer :number_to_return

      t.timestamps null: false
    end
  end
end
