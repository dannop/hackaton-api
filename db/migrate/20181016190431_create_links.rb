class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.string :name
      t.references :topic, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
