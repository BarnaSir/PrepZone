class RoutesController < ApplicationController
  before_action :authenticate_user!

	def root
		if current_user.admin
      a = rails_admin_path 
		else
			a = dashboard_path	
		end
		redirect_to a
	end	
	
end
