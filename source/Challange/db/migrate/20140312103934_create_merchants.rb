class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :add_id
      t.string :add_name
      
      t.timestamps
    end
  end
end
