class CreateUserEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :user_events do |t|
      t.datetime :event_created_at
      t.datetime :email_delivered_at
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.integer :type
      t.text :response

      t.timestamps
    end
  end
end
