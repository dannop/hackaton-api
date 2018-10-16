class CreateCommentComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
