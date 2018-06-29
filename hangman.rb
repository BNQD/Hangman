require 'sinatra'
require 'sinatra/reloader'

configure do
	enable :sessions
	set :session_secret, "secret"
end

word = "Jeremy"
progress = word.gsub /[A-Za-z0-9]/, '-'

get '/' do
	guess = params["guess"].downcase
	progress = wordManager(word, progress, guess)
	
	erb :mainpage, :locals => {
		:sessionNum => session, :word => word,
		:progress => progress
	}
end 

def wordManager (word, progress, guess)
	letters = word.downcase.split('')
	if letters.include?(guess)
		letters.each_with_index do |letter, index|
			if (letter == guess)
				progress[index] = letters[index]
			end
		end 
	end
	return progress
end