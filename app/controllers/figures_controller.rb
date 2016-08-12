class FiguresController < ApplicationController

  get '/figures' do 
    erb :'figures/index'
  end


  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures/new' do
    figure = Figure.create(name: params[:figure][:name])
    ## Landmarks
    if params[:figure].include?("landmark_ids")
      params[:figure][:landmark_ids].each do |landmark_id|
        figure.landmarks << Landmark.find(landmark_id) if !figure.landmarks.include?(Landmark.find(landmark_id))
      end
    end
    figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])if !params[:landmark][:name].empty? && !figure.landmarks.include?(Landmark.find_by(name: params[:landmark][:name]))
    ## Titles
    if params[:figure].include?("title_ids")
      params[:figure][:title_ids].each do |title_id|
        figure.titles << Title.find(title_id) if !figure.titles.include?(Title.find(title_id))
      end
    end
    figure.titles << Title.find_or_create_by(name: params[:title][:name]) if !params[:title][:name].empty? && !figure.titles.include?(Title.find_by(name: params[:title][:name]))
    figure.save
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.name = params[:figure][:name] if !params[:figure][:name].empty?
    if params[:figure].include?("landmark_ids")
      params[:figure][:landmark_ids].each do |landmark_id|
        figure.landmarks << Landmark.find(landmark_id) if !figure.landmarks.include?(Landmark.find(landmark_id))
      end
    end
    figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])if !params[:landmark][:name].empty? && !figure.landmarks.include?(Landmark.find_by(name: params[:landmark][:name]))
    ## Titles
    if params[:figure].include?("title_ids")
      params[:figure][:title_ids].each do |title_id|
        figure.titles << Title.find(title_id) if !figure.titles.include?(Title.find(title_id))
      end
    end
    figure.titles << Title.find_or_create_by(name: params[:title][:name]) if !params[:title][:name].empty? && !figure.titles.include?(Title.find_by(name: params[:title][:name]))
    figure.save
    redirect "/figures/#{figure.id}"
  end

end