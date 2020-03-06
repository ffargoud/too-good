class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Anyone can view any restaurant
      scope.all
    end
  end

  def create?
    return true # By default, new is calling create
  end

  def dashboard?
    true
  end

  def edit?
  true
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def show?
    true
  end

private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
