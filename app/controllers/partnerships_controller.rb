class PartnershipsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @partnership = Partnership.new
  end

  def create
    partner = User.where(email: params[:partner_email]).first
    return redirect_to action: 'new' if partner.nil?

    @partnership = current_user.build_partnership(partner_id: partner.id)
    if @partnership.save
      redirect_to :root
    else
      redirect_to action: 'new'
    end
  end
end
