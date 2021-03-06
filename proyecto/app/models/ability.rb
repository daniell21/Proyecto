class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
 if user.role == "admin"
   can :manage, :all
  elsif user.role == "limited"
     alias_action :create, :read, :update, :to => :cru
     can :cru, Client
     can :cru, Supplier
     can :cru, Accountreceivable
     can :cru, Accountpayable
     can :cru, ClientMail
     can :cru, Report
     can :cru, Discount
     can :cru, Rate
     can :cru, Reminder
  elsif user.role == "restricted"
     alias_action :read,  :to => :r
     can :r, Client
     can :r, Supplier
     can :r, Accountreceivable
     can :r, Accountpayable
     can :r, ClientMail
     can :r, Report
     can :r, Discount
     can :r, Rate
     can :r, Reminder
 elsif user.role == "client"
     alias_action :read, :update, :to => :ru
     can :ru, Accountreceivable
  end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
