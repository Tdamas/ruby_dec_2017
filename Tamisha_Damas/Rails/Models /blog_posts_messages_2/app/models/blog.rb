class Blog < ActiveRecord::Base
  has_many :owners
  has_many :posts

  # all the users that own a specific blog
  has_many :users, through: :owners
  #all the users that posted on a specific blog
  has_many :user_posts, through: :posts, source: :user

  validates :name, :description, presence: true, length: { minimum: 3 }
end


# # Have the first 3 blogs be owned by the first user
# Blog.find(2).users<<User.first
# Blog.first.users<<(User.first)
# Blog.find(3).users<<User.first
# Owner.create(user: User.first, blog: Blog.first)
# Owner.create(user: User.first, blog: Blog.second)
# Owner.create(user: User.first, blog: Blog.third)
#
# # Have the 4th blog you create be owned by the second user
# Blog.find(4).users<<User.second
# Owner.create(user: User.second, blog: Blog.fourth)
#
# # Have the 5th blog you create be owned by the last user
# Blog.find(5).users<<User.
# Owner.create(user: User.last, blog: Blog.fifth)
#
# # Have the third user own all of the blogs that were created.
# Blog.all.users<<User.find(3)
# Blog.all.each { |blog| Owner.create(user: User.third, blog: blog) }
# Blog.all.each { |blog| blog.users<<User.third }
#
# # Have the first user create 3 posts for the blog with an id of 2. Remember that
# # you shouldn't do Post.create(user: User.first, blog_id: 2) but more like Post.
# # create(user: User.first, blog: Blog.find(2)). Again, you should never reference the foreign key in Rails.
#  Post.create(title: "Working Out", content: "Make sure to set time aside to workout.",  user: User.first, blog: Blog.second)
#
#  # Have the second user create 5 posts for the last Blog.
#  Post.create(title: "The Fountainhead by Ayn Rand", content: "A great read, but long!",  user: User.second, blog: Blog.last)
#
#  # Have the 3rd user create several posts for different blogs.
# Post.create(title: "The Fountainhead by Ayn Rand", content: "A great read, but long!",  user: User.find(3), blog: Blog.first)

# Have the 3rd user create 2 messages for the first post created and 3 messages for the second post created
# Message.create(author: "CrossFit214", message: "We offer monthly memberships of $150/month.", user: User.third, post: Post.first)
# Message.create(author: "Mens Health Magazine", message: "Never give up!", user: User.third, post: Post.second)

# # Have the 4th user create 3 messages for the last post you created.
# Message.create(author: "A Coding Dojo Graduate", message: "Remember to stay focus.", user: User.find(4), post: Post.last)
#
# # Change the owner of the 2nd post to the last user.
# Post.second.update(user: User.last)
#
# # Change the 2nd post's content to be something else.
# Post.find(2).update(content: "To see results you have to put in the work.")
#
# # Retrieve all blogs owned by the 3rd user (make this work by simply doing: User.find(3).blogs).
# User.find(3).blogs
#
# #  Retrieve all posts that were created by the 3rd user
#  Post.find_by(user: User.third)
#
#  # Retrieve all messages left by the 3rd user
#  Message.find_by(user: User.third)
#
#  # Retrieve all posts associated with the blog id 5 as well as who left these posts.
#  Post.joins(:user, :blog).where(blog: 5).select("*")
#  Post.joins(:user, :blog).where(blog: Blog.find(5)).select("*")
#
#  # Retrieve all messages associated with the blog id 5 along with all the user information of those who left the messages
#  Message.joins(:user).where(post: Blog.find(5).posts).select("*")
#
#  # Grab all user information of those that own the first blog (make this work by allowing Blog.first.owners to work).
#  Blog.first.users
#
#  # Change it so that the first blog is no longer owned by the first user.
#  Owner.where("id = ? AND user_id = ?", 1, 1,).update_all("user_id = 5")
