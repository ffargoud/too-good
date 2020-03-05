class BasketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true # Need to be changed
  end

  def show?
    true  # All users can see all baskets
  end

  def update?
    user_is_owner_or_admin? # Only restaurant owner can change it
  end

  def destroy?
    user_is_owner_or_admin?
  end

private
  def user_is_owner_or_admin?
    record.user == user || user.admin
  end

end