class MemberMailer < ApplicationMailer
  default from: 'members@londondecom.org'

  def welcome_email
    @member = params[:member]
    mail(to: @member.email, subject: 'Welcome to London Decompression')
  end
end
