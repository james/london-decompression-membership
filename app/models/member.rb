class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true

  before_create :set_membership_number

  private

  def set_membership_number
    if membership_code = MembershipCode.where(taken: false).first
      self.membership_number = membership_code.code
    end
  end
end
