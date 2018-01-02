class Api::SessionsController < ApplicationController
  def create
    employee = params[:employee]
    username_or_email = employee[:email] ? employee[:email] : employee[:username]
    
    # TODO: remove byebug
    # make sure username_or_email has a valid value
    byebug

    @employee = Employee.find_by_credentials(
      username_or_email,
      employee[:password]
    )
  end

  def destroy
    if logged_in?
      logout!
      render jon: {}
    else
      render json: ["No current user"], status: 404
    end
  end
end
