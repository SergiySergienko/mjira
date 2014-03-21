class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def edit
    render :new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket, notice: 'Ticket was successfully created.'
    else
      render action: :new
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: 'Ticket was successfully updated.'
    else
      render action: :edit
    end
  end

  private

    def set_ticket
      @ticket = Ticket.friendly.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:id, :title, :description, :customer_name, :customer_email)
    end
end
