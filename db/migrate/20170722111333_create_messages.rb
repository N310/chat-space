class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.string :image
      t.references :user
      t.references :group
      t.timestamps
    end
    add_foreign_key :messages, :users, column: :user_id
    add_foreign_key :messages, :groups, column: :group_id
  end
end
