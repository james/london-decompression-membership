class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      MemberMailer.with(member: @member).welcome_email.deliver_now
      render template: 'members/success'
    else
      render action: :new
    end
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :burning_man_principles)
  end
end
