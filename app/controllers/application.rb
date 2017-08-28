get '/' do 
  "Hello, World"
end

# CONTACTS RESTful actions

# index
get '/contacts' do
  # "This is the contacts index action"
  @contacts = Contact.all 
  @contacts.map{ |contact| contact.email }.to_s
  erb :'contacts/index'
end

# new
get '/contacts/new' do
  # "This is the contacts new action"
  @contact = Contact.new
  erb :'contacts/new'
end

# create
post '/contacts' do
  # "This is the contacts create action"
  puts params
  @contact = Contact.create(params[:contact])
  # if @contact.valid?
  if @contact.save
    redirect '/contacts'
  else
    status 422
    @errors = @contact.errors.full_messages
    erb :'contacts/new'
  end
end

# show
get '/contacts/:id' do
  # "This is the contacts show action"
  # puts params
  @contact = Contact.find(params[:id])
  @contact.email
  erb :'contacts/show'
end

# edit
post '/contacts/:id/edit' do
  # "This is the contacts edit action"
  @contact = Contact.find(params[:id])
  erb :'contacts/edit'
end

# update
def update_contact
  puts params
  @contact = Contact.find(params[:id])
  @contact.update(params[:contact])
    # if @contact.valid?
  if @contact.save
    redirect "/contacts/#{@contact.id}"
  else
    status 422
    @errors = @contact.errors.full_messages
    erb :'contacts/new'
  end
end

patch '/contacts/:id' do
  # "This is the contacts update action"
  # puts params
  # @contact = Contact.find(params[:id])
  # @contact.update(params[:contact])
  # redirect "/contacts/#{@contact.id}"
  update_contact
end

put '/contacts/:id' do
  # "This is the contacts update action"
  update_contact
end

# delete
delete '/contacts/:id' do
  # "This is the contacts delete action"
  @contact = Contact.find(params[:id]).destroy!
  redirect '/contacts'
end