class CommentsController < ApplicationController
  before_action :set_contact

  def new
    @comment = Comment.new
  end

  def create
    @comment = @contact.comments.build(comment_params)
      if @comment.save
        redirect_to @contact
      else
        flash[:notice] = "Comment not saved"
        redirect_to @contact
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @contact
  end

  private

  def set_contact
    @contact = Contact.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :contact_id)
  end

end
