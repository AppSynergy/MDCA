require 'sqlite3'
require 'sinatra'
require 'active_record'

class Contact < ActiveRecord::Base
end

post '/' do
  Contact.establish_connection(
    :adapter => "sqlite3",
    :database => "contacts.db"
  )
  
  @name = params[:name]
  @email = params[:email]
  @occ = params[:occupation]
  @msg = params[:message]
  
  c = Contact.new
  c.name = @name
  c.email = @email
  c.occupation = @occ
  c.message = @msg
  c.save
end