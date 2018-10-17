class CreateUserAches < ActiveRecord::Migration[5.1]
  def change
    create_table :user_aches do |t|
      t.references :user, foreign_key: true
      t.references :achievment, foreign_key: true
	  t.integer :counter, :default => 0
	  t.boolean :check, :default => false

      t.timestamps
    end
  end
end
