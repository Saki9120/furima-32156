class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table  :addresses do |t|
      t.string    :postal_code    ,null: false
      t.integer   :prefecture_id  ,null: false
      t.string    :city           ,null: false
      t.string    :address_line_1 ,null: false
      t.string    :address_line_2 ,null: false
      t.string    :tel            ,null: false

      t.timestamps
    end
  end
end
