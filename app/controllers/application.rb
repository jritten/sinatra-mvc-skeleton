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
  erb :'contacts/new'
end

# create
post '/contacts' do
  # "This is the contacts create action"
  puts params
  @contact = Contact.create(params[:contact])
  redirect '/contacts'
end

# show
get '/contacts/:id' do
  # "This is the contacts show action"
  # puts params
  @contact = Contact.find(params[:id])
  # @contact.email
  erb :'contacts/show'
end

# edit
post '/contacts/:id/edit' do
  "This is the contacts edit action"
end

# update
patch '/contacts/:id' do
  "This is the contacts update action"
end

put '/contacts/:id' do
  "This is the contacts update action"
end

# delete
delete '/contacts/:id' do
  "This is the contacts delete action"
end