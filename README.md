# PrepZone

A place to practise MCQs to prepare for entrance examination.

Demo images:

<img src="https://raw.githubusercontent.com/BarnaSir/PrepZone/master/site-images/login.png" width="220"><img src="https://raw.githubusercontent.com/BarnaSir/PrepZone/master/site-images/admin-dashboard.png" width="220"><img src="https://raw.githubusercontent.com/BarnaSir/PrepZone/master/site-images/user_dashboard.png" width="220"><img src="https://raw.githubusercontent.com/BarnaSir/PrepZone/master/site-images/lorem-chapters.png" width="220"><img src="https://raw.githubusercontent.com/BarnaSir/PrepZone/master/site-images/practise-area.png" width="220"><img src="https://raw.githubusercontent.com/BarnaSir/PrepZone/master/site-images/review-practise.png" width="220">     

## Primary requirements
* Ruby version:  2.40
* Rails version: 5.1

## Installation

Follow these easy steps to install and start the app:

### Set up Rails app

First, clone the repo and install the gems required by the application:
    
    git clone https://github.com/BarnaSir/PrepZone
    bundle

Next, run the migrations:

	rails db:migrate


### Start the app

Start the Rails app.

     rails server
     
## For admin:

* Sign up for a normal account.
* Provide the admin access to your account from the rails console.
    
        rails console
        
        # To find your id(user id), 
        >> User.all
        # Then, give admin access to your account. Suppose, the id is 1.
        >> User.find(1).toggle!(:admin)
        
After gaining the admin access, head on to [Admin dashboard](localhost:3000/admin) to add chapters and questions of subjects.

## Further upcoming improvements

* Student can compete against each other by enrolling in competitions.
* Performance of student will be tracked on the basis of their practise scores as well as scores from their participated competitions.