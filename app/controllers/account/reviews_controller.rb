class Account::ReviewsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reviews = current_user.reviews.paginate(:page => params[:page], :per_page => 5)
  end
end
