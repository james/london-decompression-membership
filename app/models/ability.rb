class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user && user.read_admin?
    can :read, :all                # allow everyone to read everything
    can :access, :rails_admin       # only allow admin users to access Rails Admin
    can :read, :dashboard           # allow access to dashboard
    if user.write_admin?
      can :manage, :all             # allow superadmins to do anything
    end
  end
end
