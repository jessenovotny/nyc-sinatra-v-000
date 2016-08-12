class LandmarksController < ApplicationController

  get '/landmarks' do
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks/new' do
    landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  post '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.name = params[:landmark][:name] if !params[:landmark][:name].empty?
    landmark.year_completed = params[:landmark][:year_completed] if !params[:landmark][:year_completed].empty?
    landmark.save
    redirect "/landmarks/#{landmark.id}"
  end
end
