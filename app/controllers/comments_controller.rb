class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        flash[:notice] = "Comment successfully created"
        redirect_to contacts_path(@contact)
      else
        flash[:notice] = "Comment not saved"
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @contact
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :contact_id)
  end

end
