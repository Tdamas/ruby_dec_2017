class Blog < ActiveRecord::Base
  has_many :owners
  has_many :posts

  # all the users that own a specific blog
  has_many :users, through: :owners
  #all the users that posted on a specific blog
  has_many :user_posts, through: :posts, source: :user

  validates :name, :description, presence: true, length: { minimum: 3 }
end


# Have the first 3 blogs be owned by the first user
Blog.find(2).users<<User.first
Blog.first.users<<(User.first)
Blog.find(3).users<<User.first
Owner.create(user: User.first, blog: Blog.first)
Owner.create(user: User.first, blog: Blog.second)
Owner.create(user: User.first, blog: Blog.third)

# Have the 4th blog you create be owned by the second user
Blog.find(4).users<<User.second
Owner.create(user: User.second, blog: Blog.fourth)

# Have the 5th blog you create be owned by the last user
Blog.find(5).users<<User.
Owner.create(user: User.last, blog: Blog.fifth)

# Have the third user own all of the blogs that were created.
Blog.all.users<<User.find(3)
Blog.all.each { |blog| Owner.create(user: User.third, blog: blog) }
Blog.all.each { |blog| blog.users<<User.third }

# Have the first user create 3 posts for the blog with an id of 2. Remember that
# you shouldn't do Post.create(user: User.first, blog_id: 2) but more like Post.
# create(user: User.first, blog: Blog.find(2)). Again, you should never reference the foreign key in Rails.
 Post.create(title: "Working Out", content: "Make sure to set time aside to workout.",  user: User.first, blog: Blog.second)

 # Have the second user create 5 posts for the last Blog.
 Post.create(title: "The Fountainhead by Ayn Rand", content: "A great read, but long!",  user: User.second, blog: Blog.last)
