class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :burning_man_principles, acceptance: true, on: :create
  validates :membership_status, presence: true, inclusion: { in: %w(associate volunteer full) }

  before_create :set_membership_number
  before_destroy :release_membership_number

  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  def membership_status_enum
    %w(associate volunteer full)
  end

  def has_account?
    encrypted_password.present?
  end

  def read_admin?
    membership_status == 'volunteer' ||
    membership_status == 'full'
  end

  def write_admin?
    membership_status == 'full'
  end

  private

  def set_membership_number
    if membership_code = MembershipCode.where(taken: false).first
      self.membership_number = membership_code.code
      membership_code.taken!
    end
  end

  def release_membership_number
    if membership_code = MembershipCode.where(code: self.membership_number).first
      membership_code.available!
    end
  end
end
