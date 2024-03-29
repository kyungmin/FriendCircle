class CreatePostShares < ActiveRecord::Migration
  def change
    create_table :post_shares do |t|
      t.integer :post_id, null: false
      t.integer :circle_id, null: false
      t.timestamps
    end
    add_index :post_shares, :post_id
    add_index :post_shares, :circle_id
    add_index :post_shares, [:post_id, :circle_id], unique: true
  end
end
