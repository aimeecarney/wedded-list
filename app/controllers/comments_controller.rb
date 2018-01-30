class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @contact = @comment.contact
      if @comment.save
        redirect_to @contact
      else
        flash[:notice] = "Comment not saved"
        redirect_to @contact
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @contact = @comment.contact
    @comment.destroy
    redirect_to @contact
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :contact_id)
  end

end
