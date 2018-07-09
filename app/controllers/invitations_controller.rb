# app/controllers/invitations_controller.rb

class InvitationsController < ApplicationController
  before_action :require_user

  def new
    @invitation = Invitation.new
  end

  def create
    @invitation = Invitation.create(params.require(:invitation).permit!.merge!(inviter_id: current_user.id))
    if @invitation.save
      ApplicationMailer.send_invitation_email(@invitation).deliver
      flash[:success] = "You have successfully invited #{@invitation.recipient_name}."
      redirect_to new_invitation_path
    else
      flash[:error] = 'Please check your inputs.'
      render :new
    end
  end
end
