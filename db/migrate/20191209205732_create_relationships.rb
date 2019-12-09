class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :attendee_id
      t.integer :attended_event_id

      t.timestamps
    end
    add_index :relationships, :attendee_id
    add_index :relationships, :attended_event_id
    add_index :relationships, [:attendee_id, :attended_event_id], unique: true
  end
end
