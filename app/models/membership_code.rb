class MembershipCode < ApplicationRecord
  def taken!
    self.update_attribute(:taken, true)
  end

  def available!
    self.update_attribute(:taken, false)    
  end
end
