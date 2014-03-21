class AdminController < ApplicationController
  before_filter :authenticate_user!
  after_action :verify_authorized, except: [:show]

  layout 'admin'

end