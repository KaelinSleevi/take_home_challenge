class CreateSubscription < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :customers, foreign_key: true
      t.string :title
      t.float :price
      t.string :status
      t.string :frequency

      t.timestamps
    end
  end
end
