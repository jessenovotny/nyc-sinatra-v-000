class FiguresController < ApplicationController

  get '/figures/new' do
    binding.pry
    erb :'figures/new'
  end

  post '/figures/new' do

    #create a new figure, etc.
    #go to the vigures view page
  end

end