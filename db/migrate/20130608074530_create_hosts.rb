class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.text :url
      t.boolean :enabled,  index: true, default: true
      t.integer :interval, index: true, default: 5
      t.integer :owner_id, index: true

      t.timestamps
    end
    
    add_index :hosts, [:enabled, :interval]
    
  end
end
