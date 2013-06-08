class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.integer :host_id, index: true
      t.integer :response_code
      t.text    :response_header
      t.float   :response_time

      t.timestamps
    end
  end
end
