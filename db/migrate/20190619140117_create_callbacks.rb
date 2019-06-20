class CreateCallbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :callbacks do |t|
      t.references :account, foreign_key: true
      t.integer :event
      t.timestamp :timestamp
      t.string :message_token
      t.boolean :handled, default: false
      t.json :data

      t.timestamps
    end
  end
end
