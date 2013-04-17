class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def show_mission
    render :partial => "static_pages/mission"
  end
  
  def show_members
    render :partial => "static_pages/members"
  end
  
  def show_partners
    render :partial => "static_pages/partial"
  end
  
  def show_history
    render :partial => "satic_pages/history"
  end
end
