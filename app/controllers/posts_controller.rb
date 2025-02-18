class PostsController < ApplicationController

  # similar to get request
  def index
    posts = Post.includes(:user, :comments, :likes).order(created_at: :desc)
    render json: posts, include: [:user, :comments, :likes]
  end
  
  # post request
  def create
    Rails.logger.debug "Received params: #{params.inspect}"  # Prints all received parameters
    post = Post.new(post_params)
    
    if post.save
    Rails.logger.debug "Post successfully created: #{post.inspect}"  # Logs successful creation
      render json: post, status: :created
    else
    Rails.logger.debug "Post creation failed: #{post.errors.full_messages.inspect}"  # Logs errors
      render json: { error: "Post could not be created",
                     messages: post.errors.full_messages },
                     status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end


# const { Post, User, Comment, Like } = require('./models'); // Sequelize models

# // GET /posts
# app.get('/posts', async (req, res) => {
#   try {
#     const posts = await Post.findAll({
#       include: [
#         { model: User },
#         { model: Comment },
#         { model: Like }
#       ],
#       order: [['created_at', 'DESC']]
#     });
#     res.json(posts);
#   } catch (error) {
#     console.error(error);
#     res.status(500).json({ error: "An error occurred while fetching posts" });
#   }
# });

# // POST /posts
# app.post('/posts', async (req, res) => {
#   try {
#     const { content, user_id } = req.body;
#     const post = await Post.create({ content, user_id });

#     // Return created post
#     res.status(201).json(post);
#   } catch (error) {
#     console.error(error);
#     res.status(422).json({ error: "Post could not be created" });
#   }
# });

