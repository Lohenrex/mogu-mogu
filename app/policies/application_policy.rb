# frozen_string_literal: true

class ApplicationPolicy
  class Scope
    def initialize(user, scope)
      raise Pundit::NotAuthorizedError, "must be logged in" unless user

      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end

  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user

    @user   = user
    @record = record
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def permitted_attributes
    []
  end

  protected

  def admin_or_owner?
    admin? || owner?
  end

  def admin?
    user.admin?
  end

  def owner?
    resource.user == user
  end

  def free?
    user.free?
  end

  def premium?
    user.premium?
  end

  def member?
    user.free? || user.premium? || user.admin?
  end
end
