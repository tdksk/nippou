class BoardController < ApplicationController
  before_filter :authenticate_user!
  before_filter :initialize_filter

  def index
    @dates = 2.weeks.ago.to_date..Date.today
  end
end
