class AddLocationAndRegionToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :location, :string
    add_column :jobs, :region, :string

    add_index :jobs, :region
  end
end
