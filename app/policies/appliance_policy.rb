# frozen_string_literal: true

class AppliancePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        false
      end
    end
  end

  def index?
    admin?
  end

  def new?
    admin?
  end

  def create?
    admin?
  end

  def show?
    admin?
  end

  def edit?
    admin?
  end

  def update?
    admin?
  end

  def destroy?
    admin?
  end
end
