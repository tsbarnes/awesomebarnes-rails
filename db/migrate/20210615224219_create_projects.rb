class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.string :description
      t.integer :order

      t.timestamps
    end
  end
end
