class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.string :position
      t.integer :rate
      t.date :start_date
      t.date :end_date
      t.boolean :is_avaliable

      t.timestamps
    end

    add_index :jobs, :user_id,        :unique => true
    add_index :jobs, :position
    add_index :jobs, :rate
    add_index :jobs, :is_avaliable
  end
end
