# frozen_string_literal: true

class RecipePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end

  def new?
    member?
  end

  def create?
    member?
  end

  def show?
    member?
  end

  def edit?
    admin_or_owner?
  end

  def update?
    admin_or_owner?
  end

  def destroy?
    admin_or_owner?
  end
end
