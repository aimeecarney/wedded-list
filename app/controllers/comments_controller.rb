class CommentsController < ApplicationController
  before_action :set_contact, only: [:index, :create]

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
      end
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @contact
  end

  private

  def set_contact
    @contact = Contact.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :contact_id)
  end

end
