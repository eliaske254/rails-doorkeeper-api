class ApiController < ApplicationController
  # equivalent of aunthenticate_user! on devise, biut this will check the oath token
  # before_action :authenticate_user!
  before_action :doorkeeper_authorize!

  # skip checking CSRF token authenticity for API requests
  skip_before_action :verify_authenticity_token

  #set response type
  respond_to :json

  # helper method to access the current user from the token
  def current_user
    return unless doorkeeper_token
    @current_user ||= User.find_by(id: doorkeeper_token[:resource_owner_id])

  end
end