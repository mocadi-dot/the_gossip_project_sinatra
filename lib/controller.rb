require 'gossip'
require 'bundler'
require 'pry'
Bundler.require

class ApplicationController < Sinatra::Base
  # Affiche la page d'accueil, potins
    get '/' do
      erb :index, locals: {gossips: gossip.all}
    end

    # nouveau ragot
    get '/gossips/new/' do
      erb :new_gossip
    end

      # saisie dans gossip.csv
    post '/gossips/new/' do
   # nouvel objet gossip et sauvegarde
      gossip.new(params["gossip_author"], params["gossip_content"]).save
      redirect '/'  # save et return
    end

    get '/gossips/:id/' do
    		erb :show, locals: {gossips: gossip.find(params[:id])}

    	end
end
