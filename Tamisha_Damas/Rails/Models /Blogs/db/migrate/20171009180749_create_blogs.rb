class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end

# ///////retrieving all post for the first blog
# Blog.first.posts
# ////////know how to retrieve all posts for the last blog (sorted by title in the DESC order).
# Blog.last.posts.order(title: :DESC)
# /////////know how to update the first post's title.
# Post.first.update(title:"Red Bottoms")
# /////////know how to delete the third post (have the model automatically delete all messages associated with the third post when you delete the third post).
# Post.third.messages.destroy_all
# know how to retrieve all blogs
# Blog.all
# know how to retrieve all blogs whose id is less than 5.
# Blog.where("id < ?", 5)
