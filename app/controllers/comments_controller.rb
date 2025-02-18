class CommentsController < ApplicationController
    # POST /posts/:post_id/comments
    def create
      post = Post.find(params[:post_id])  # Find the post using the post_id from the URL
      comment = post.comments.new(comment_params)  # Associate the comment with the post
  
      if comment.save
        render json: comment, status: :created
      else
        render json: { error: "Comment could not be created" }, status: :unprocessable_entity
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:content, :user_id)  # Only permit content and user_id
    end
  end
  