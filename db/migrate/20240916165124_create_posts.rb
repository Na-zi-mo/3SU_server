class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, default: ""
      t.text :body
      t.boolean :published, default: false
      t.belongs_to :page
      
      t.timestamps
    end
  end
end
