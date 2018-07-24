class MembershipCode < ApplicationRecord
  def taken!
    self.update_attribute(:taken, true)
  end
end
