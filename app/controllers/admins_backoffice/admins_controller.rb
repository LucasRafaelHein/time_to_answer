class AdminsBackoffice::AdminsController < ApplicationController
  layout "admins_backoffice"
  def index
    @admins = Admin.all
  end
end
