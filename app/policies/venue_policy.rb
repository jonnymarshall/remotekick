class VenuePolicy < ApplicationPolicy

  def initialize(user, venue)
    @user = user
    @venue = venue
  end

  def edit?
    user_is_authorized?
  end

  def update?
    user_is_authorized?
  end

  def destroy?
    user_is_authorized?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_authorized?
    venue_user = @venue.venue_users.find_by(user: @user)
    
    # Checks if there is a venue_user association between the user and venue
    if !venue_user
      false
    # Checks if venue_user works for the venue
    elsif venue_user.owner? || venue_user.employee?
      true
    elsif venue_user.guest?
      # If user is venue_user is a guest, checks to see if an employee or owner exists for venue
      VenueUser.employee.or(VenueUser.owner).where(venue: @venue).none? ? true : false
    else
      raise "Error: User venue_user's user_type was not recognised"
    end
  end
end
