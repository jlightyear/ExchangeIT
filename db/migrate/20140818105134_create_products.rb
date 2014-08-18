class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string 	:name
    	t.string 	:description
    	t.string 	:imagen
    	t.integer	:user_id
    	t.string	:categoria

      t.timestamps
    end
  end
end
