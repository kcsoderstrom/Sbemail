class CommentsController < ApplicationController


  def index
    if params[:user_id]
      commentable_type_sym = :user
    elsif params[:contact_id]
      commentable_type_sym = :contact
    else
      raise "Invalid commentable type"
    end

    commentable_type = commentable_type_sym.to_s.camelize.constantize

    commentable_id = params["#{commentable_type_sym}_id".to_sym]
    commentable = commentable_type.find(commentable_id)

    render json: commentable.comments
  end

  def create
    commentable_type = commentable_params[:commentable_type].constantize
    if [User, Contact].include?(commentable_type)
      commentable = commentable_type.find(commentable_params[:commentable_id])
      comment = commentable.comments.build(comment_params)

      if commentable.save
        render json: comment
      else
        render(
          json: comment.errors.full_messages, status: :unprocessable_entity
        )
      end
    else
      render text: "STOP HACKIN ARE STUFF"
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      render json: comment
    else
      render(
        json: comment.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      render json: comment
    else
      render text: "No you must stick to your word!"
    end
  rescue ActiveRecord::RecordNotFound
    render text: "Ain't there."
  end

  private
  def comment_params
    params[:comment].permit(:body, :author_id)
  end

  def commentable_params
    params[:comment].permit(:commentable_id, :commentable_type)
  end
end
