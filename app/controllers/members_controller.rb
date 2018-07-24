class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      render template: 'members/success'
    else
      render action: :new
    end
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :email)
  end
end
