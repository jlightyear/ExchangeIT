class RemoveColumnImage < ActiveRecord::Migration
  def change
  	remove_column :products, :imagen, :string
  end
end
