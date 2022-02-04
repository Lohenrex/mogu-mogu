# frozen_string_literal: true

class IngredientCategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      return false unless user.admin?

      scope.all
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
