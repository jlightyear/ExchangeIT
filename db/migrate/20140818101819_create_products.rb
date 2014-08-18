class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string 	:name
    	t.string 	:description
    	t.string 	:referencia
    	t.integer :user_id
    	t.integer :categoria_id
    	t.string	:localizacion

      t.timestamps
    end
  end
end
