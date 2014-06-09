class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :title
      t.string :owner

      t.timestamps
    end
  end
end
