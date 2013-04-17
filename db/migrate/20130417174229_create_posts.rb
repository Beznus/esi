class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
	  t.string :title
	  t.string :description
	  t.string :tags
	  
      t.timestamps
    end
	add_index :posts, :title, unique: true
  end
end
