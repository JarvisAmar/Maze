class HomeController < ApplicationController
  def index
    @title_text = "MAZE"
    @posts = Post.includes(:user, :comments, :likes).order(created_at: :desc)
  end
end
