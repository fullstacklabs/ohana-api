class CategoryPolicy < ApplicationPolicy
  def new?
    return true if user.super_admin?
    Pundit.policy_scope!(user, Category).present?
  end

  class Scope < Scope
    def resolve
      return scope if user.super_admin?
    end
  end
end
