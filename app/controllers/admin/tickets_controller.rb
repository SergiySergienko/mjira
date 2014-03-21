class Admin::TicketsController < AdminController

  before_action :set_ticket, only: [:show, :edit, :update, :destroy, :quick_jump]

  def quick_jump
    redirect_to action: :show, id: @ticket.id
  end

  def index
    @tickets = Ticket.all
    authorize @tickets
  end

  def show
  end

  def new
    @ticket = Ticket.new
    authorize @ticket
  end

  def edit
    render :new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    authorize @ticket
    if @ticket.save
      redirect_to action: :index, notice: 'Ticket was successfully created.'
    else
      render action: :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to action: :index, notice: 'Ticket was successfully updated.'
    else
      render action: :edit
    end
  end

  def destroy
    Ticket.friendly.find(params[:id]).destroy!
    redirect_to action: :index
  end

  private

  def set_ticket
    begin
      @ticket = Ticket.friendly.find(params[:id])
    rescue => e
      redirect_to action: :index, notice: 'Ticket not found' and return unless @ticket
    end
    authorize @ticket
  end

  def ticket_params
    params.require(:ticket).permit(:id, :ticket_status_id, :title, :description, :customer_name, :customer_email)
  end
end
