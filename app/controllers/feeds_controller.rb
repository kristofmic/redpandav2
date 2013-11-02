class FeedsController < ApplicationController
  def index
  	if signed_in?
	  	render partial: 'feeds/index' 
	  else
	  	render nothing: true, status: 200
	  end
  end

end