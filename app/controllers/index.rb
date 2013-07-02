get '/' do
	@note = Note.all
  erb :index
end

# Get the New Note form
get '/notes/new' do
	@note = Note.new
	erb :"notes/create"
end

# If successful, redirects to Note's own page.
# Else, goes back to form where user can modify/resubmit.
post '/notes' do
	@note = Note.create(params[:note])
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

# For Edit Note
put "/notes/:id" do |id|
	@note = Note.find(id)
	if @note.update_attributes(params[:note])
		redirect "notes/#{@note.id}"
	else
		erb :"notes/edit"
	end
end

# 'delete' doesn't work but 'get' does?
delete "/notes/:id/delete" do |id|
	Note.find(id.to_i).destroy
	#@messages = "Note deleted"
end



