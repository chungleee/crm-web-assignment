# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative 'contact'
require 'sinatra'

# fake date

Contact.create('Leon', 'Chung', 'leon@bitmaker.com', 'pingpong champ')
Contact.create('Honey', 'Baby', 'dogs@montreal.com', 'dogs of montreal')
Contact.create('Web', 'Dev', 'webdev@code.com', 'jr')


get '/' do
  @crm_app_name = "Leon's CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new_contact' do
  erb :new_contact
end
