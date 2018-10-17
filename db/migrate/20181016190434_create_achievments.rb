class CreateAchievments < ActiveRecord::Migration[5.1]
  def change
    create_table :achievments do |t|
      t.string :name
      t.string :description
      t.string :images

      t.timestamps
    end
  end
end
