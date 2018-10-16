class CreateComents < ActiveRecord::Migration[5.1]
  def change
    create_table :coments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
