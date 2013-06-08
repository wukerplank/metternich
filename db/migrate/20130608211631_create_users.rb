class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :twitter_uid, index: true
      t.text   :twitter_hash

      t.timestamps
    end
  end
end
