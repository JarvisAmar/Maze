class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end

# dependent: :destroy: This option ensures that when a Post is deleted, 
# all of its associated comments are also deleted from the database. 