RailsAdmin.config do |config|
  ### Popular gems integration
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version'
  PAPER_TRAIL_AUDIT_MODEL=['User']

  # == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

	# config.model Category do
	# 	field :category
	# 	field :created_at
	# 	field :updated_at
	# 	field :exams
	# end
  
	#add custom link of user dashboard
	config.navigation_static_links = {
					'User dashboard' => 'http://banasir.herokuapp.com/dashboard'
	}


  #enable nice creation of exam. show only certain fields

  config.model Category do
    navigation_icon 'icon-list'
		configure :exams do
			hide
		end 
    object_label_method do
      :category_label_method
    end
	end


  def category_label_method
    "#{self.category}"
  end

	config.model Exam do
    navigation_icon 'icon-check'
		create do
			field :name
			field :category 
			field :questions
	  end
		object_label_method do
			:exam_label_method
		end
	end	

	config.model Competition do
    navigation_icon 'icon-check'

		create do
			field :name
			field :category
			field :starting_date
			# field :questions
	  end
		object_label_method do
			:exam_label_method
		end

	end	

	config.model Question do 
    navigation_icon 'icon-tasks'
		nested do
			configure :exam do
				hide
			end
		end
	end

  config.model Answer do
    navigation_icon 'icon-pencil'
		nested do
			configure :question do
				hide
			end
		end
	end
  
  # config.model Score do
	# 	navigation_icon 'icon-play'
  # end

  config.model User do
    navigation_icon 'icon-user'
		list do
			field :id
			field :username
			field :email
			field :avatar
			field :created_at
			field :current_sign_in_ip
			field :sign_in_count
			field :provider
			field :uid
			field :confirmation_sent_at
			field :current_sign_in_ip
			field :last_sign_in_ip
			field :current_sign_in_at
			field :last_sign_in_at
			field :confirmed_at
			field :confirmation_sent_at
			field :confirmation_token
			field :reset_password_sent_at
			field :updated_at
		end

		create do
			field :username do
				required true
			end
			field :email do
				required true
			end
			field :avatar do
				#required true
			end
			field :password do
				required true
			end
			field :password_confirmation do
				required true
			end
		end
    object_label_method do
			:user_label_method
    end
	end

  def user_label_method
   "#{self.username}" 
  end
  
	def exam_label_method
		"#{self.name}"
	end
  	
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
			except ['Answer','Question','Score'] 
		end
    export
    bulk_delete
    show
    edit
    delete do
						except ['User','Category']
		end
    show_in_app

    ## With an audit adapter, you can add:
    history_index do
			only PAPER_TRAIL_AUDIT_MODEL
	 	end
    history_show do
			only PAPER_TRAIL_AUDIT_MODEL
		end
  end
	config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin?
  end
end
