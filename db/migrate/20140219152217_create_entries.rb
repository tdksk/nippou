class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :date
      t.text :body
      t.references :user, index: true

      t.timestamps
    end

    add_index(:entries, [:date, :user_id], :unique => true)
  end
end
