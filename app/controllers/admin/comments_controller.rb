class Admin::CommentsController < AdminController

  before_action :set_ticket
  before_action :set_comment, except: [:index]

  def index
    @comments = @ticket.comments
    authorize @comments
  end

  def show
  end

  def new
  end

  def edit
    render :new
  end

  def create
    @comment.assign_attributes(comment_params)
    if @comment.save
      redirect_to action: :index, notice: 'Comment was successfully created.'
    else
      render action: :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to action: :index, notice: 'Comment was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    Comment.find(params[:id]).destroy!
    redirect_to action: :index
  end

  private

  def set_ticket
    @ticket = Ticket.friendly.find(params[:ticket_id])
    authorize @ticket
  end

  def set_comment
    @comment = Comment.new
    if params[:id]
      @comment = @ticket.comments.find(params[:id])
    else
      @comment = @ticket.comments.new
    end
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:id, :ticket_id, :body)
  end
end
