class Member < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, email: true
  validates :burning_man_principles, acceptance: true, on: :create
  validates :membership_status, presence: true, inclusion: { in: %w(associate full) }
  validates :access, presence: true, inclusion: { in: %w(none read admin) }

  before_create :set_membership_number
  before_destroy :release_membership_number
  before_create :downcase_email

  devise :database_authenticatable, :recoverable, :rememberable, :trackable

  def membership_status_enum
    %w(associate full)
  end

  def access_enum
    %w(none read admin)
  end

  def has_account?
    encrypted_password.present?
  end

  def read_admin?
    access == 'read' ||
    access == 'admin'
  end

  def write_admin?
    access == 'admin'
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

  def downcase_email
    self.email = self.email.downcase
  end
end
