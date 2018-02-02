class CommentsController < ApplicationController
  before_action :set_contact

  def new
    @comment = Comment.new
  end

  def index
    @comments = @contact.comments
    render 'index.html', :layout => false
  end

  def create
    @comment = @contact.comments.build(comment_params)
      if @comment.save
        render 'comments/show', :layout => false
      else
        flash[:notice] = "Comment not saved"
        render "contacts/${@contact.id}"
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @contact
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :contact_id)
  end

end
