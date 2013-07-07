class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :omniauth_uid, :index=>true
      t.string :email, :after=>:nickname
      t.string :remember_me_token, :limit=>32, :after=>:email
      t.timestamps
    end
  end
end
