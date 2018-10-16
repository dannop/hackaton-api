class CreateUserAches < ActiveRecord::Migration[5.1]
  def change
    create_table :user_aches do |t|
      t.references :user, foreign_key: true
      t.references :achievment, foreign_key: true

      t.timestamps
    end
  end
end
