class TicketPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    @user.admin?
  end

  def quick_jump?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def index?
    @user.admin?
  end

  def edit?
    @user.admin?
  end

  def show?
    @user.admin?
  end

  def update_assigment?
    @user.admin?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

end
