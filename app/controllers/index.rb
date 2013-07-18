get '/' do
	@note = Note.all
  erb :index
end

# Get the New Note form
get '/notes/new' do
	@note = Note.new  #for error check 
	erb :"notes/create"
end

# If successful, redirects to Note's own page.
# Else, goes back to form where user can modify/resubmit.
post '/notes' do
	@note = Note.new(params[:note])
	if @note.save
		redirect "notes/#{@note.id}"
	else
		erb :"notes/create"
	end
end

# Get the individual page of Note with this ID
get "/notes/:id" do |id|
	@note = Note.find(id)
	erb :"notes/show"
end

# Get the Edit Note form of the Note with this ID
get '/notes/:id/edit' do |id|
	@note = Note.find(id)
	erb :"notes/edit"
end

# For Edit Note: .update_attributes
# Updates all the attributes from the passed-in Hash 
# and saves the record. If the object is invalid, 
# the saving will fail and false will be returned.
put "/notes/:id" do |id|
	@note = Note.find(id)
	if @note.update_attributes(params[:note])
		redirect "notes/#{@note.id}"
	else
		erb :"notes/edit"
	end
end

delete "/notes/:id" do |id|
	Note.find(id).destroy
	redirect '/'
end



