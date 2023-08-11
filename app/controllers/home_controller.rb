class HomeController < ApplicationController

	def index
		if signed_in?

		else
			redirect_to new_user_session_path
		end		
	end

end