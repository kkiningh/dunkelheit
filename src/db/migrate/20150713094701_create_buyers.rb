class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :name
      t.binary :public_key

      t.timestamps null: false
    end
  end
end
