# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

# fake date

# Contact.create('Leon', 'Chung', 'leon@bitmaker.com', 'pingpong champ')
# Contact.create('Honey', 'Baby', 'dogs@montreal.com', 'dogs of montreal')
# Contact.create('Web', 'Dev', 'webdev@code.com', 'jr')


get '/' do
  # @crm_app_name = "Leon's CRM"
  erb :index
end

get '/contacts' do
  @count = Contact.all.count
  erb :contacts
end

get '/contacts/new_contact' do
  erb :new_contact
end

post '/contacts' do
  contact = Contact.create(
  first_name: params[:first_name],
  last_name:  params[:last_name],
  email:      params[:email],
  note:       params[:note]
  )
  redirect to('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact = Contact.update(
    @contact.id,
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note])
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end


after do
  ActiveRecord::Base.connection.close
end
