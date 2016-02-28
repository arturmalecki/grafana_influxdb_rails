class UsersController < ApplicationController
  def index
    render json: { data: 'User list' }
  end

  def show
    render json: { data: 'User details' }
  end
end
