class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def show?
    user_is_owner_or_admin?
  end

  def destroy?
    true
  end

  private
  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
