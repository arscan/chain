class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.datetime :datetime
      t.references :activity

      t.timestamps
    end
    add_index :checks, :activity_id
  end
end
