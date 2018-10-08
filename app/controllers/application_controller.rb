class ApplicationController < ActionController::Base

protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }


  # protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit 
  		
end
