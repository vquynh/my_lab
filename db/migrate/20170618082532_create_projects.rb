class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :thumb_image
      t.text :main_image

      t.timestamps
    end
  end
end
