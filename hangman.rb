require 'sinatra'
require 'sinatra/reloader'

configure do
	enable :sessions
	set :session_secret, "secret"
end

get '/' do
	guess = params["guess"]
	word = "Jeremy"
	correct = wordManager(word, guess)
	progress = word
	erb :mainpage, :locals => {
		:sessionNum => session, :check => correct, :word => word,
		:progress => progress
	}
end 

def wordManager (word, guess)
	letters = word.split('')
	if letters.include?(guess)
		return "Inside!"
	else
		return "Not Included"
	end
	return "Bleb"
end