class CommentsController < ApplicationController
  
  def index
  	@comments = Comment.all.joins(:product).select('*')
  	render '/comments/comment'
  end	

  def comment
  	Comment.create(comment:params['comment']['comment'], product_id:params['comment']['product_id'].to_i)
  	redirect_to '/products'
  end
end
