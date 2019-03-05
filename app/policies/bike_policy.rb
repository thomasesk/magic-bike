class BikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def set_bike?
    return true
  end

  def show?
    return true
  end

  def new?
    return true
  end

  def create?
    return new?
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def destroy?
    record.user == user
  end

end
