class StaticPagesController < ApplicationController
  def home
    @posts = Post.find(:all, :limit => 3, :order => 'created_by DESC')
  end

  def help
  end
  
  def about
  end
  
  def contact
    @contact
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
