class Admin::AssigmentsController < AdminController

  before_action :set_ticket, only: [:update_assigment]

  def update_assigment
    @ticket.assign_to(current_user)
    @ticket.save!
    redirect_to admin_tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.friendly.find(ticket_params[:ticket_id])
    authorize @ticket
  end

  def ticket_params
    params
  end
end
