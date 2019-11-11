Rails.application.routes.draw do
root to: 'tweets#toppage'
  resources :tweets do 
  	collection do 
  		post :confirm
  	end
  end
end
