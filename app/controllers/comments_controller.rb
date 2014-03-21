class CommentsController < ApplicationController

  before_action :set_ticket
  before_action :set_comment, except: [:index]

  def new
  end

  def create
    @comment.assign_attributes(comment_params)
    if @comment.save
      redirect_to ticket_path(@ticket), notice: 'Comment was successfully created.'
    else
      render action: :new
    end
  end

  private

  def set_ticket
    @ticket = Ticket.friendly.find(params[:ticket_id])
  end

  def set_comment
    @comment = Comment.new
    if params[:id]
      @comment = @ticket.comments.find(params[:id])
    else
      @comment = @ticket.comments.new
    end
  end

  def comment_params
    params.require(:comment).permit(:id, :ticket_id, :body)
  end
end
