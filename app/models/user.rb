class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  # has_secure_password  # Enables password authentication
end


    # The User model you’ve defined here establishes several associations in Rails:

    # has_many :posts:

    # This means that a user can have many posts. The corresponding Post model should have a user_id field, establishing a one-to-many relationship between the User and Post models.
    # In the Post model, you’ll need to declare the inverse relationship like this:
    # ruby
    # Copy
    # Edit
    # class Post < ApplicationRecord
    #   belongs_to :user
    # end