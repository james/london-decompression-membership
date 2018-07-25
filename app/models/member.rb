class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :burning_man_principles, acceptance: true, on: :create
  validates :membership_status, presence: true, inclusion: { in: %w(associate full) }

  before_create :set_membership_number

  def membership_status_enum
    %w(associate full)
  end

  private

  def set_membership_number
    if membership_code = MembershipCode.where(taken: false).first
      self.membership_number = membership_code.code
      membership_code.taken!
    end
  end
end
