class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.integer :user_id
      t.text :body
      t.string :status, :default => "not yet started"

      t.timestamps
    end
  end
end
