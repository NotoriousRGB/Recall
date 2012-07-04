require 'rubygems'  
require 'sinatra'  
require 'data_mapper'
require 'dm-core'  
require 'dm-timestamps'  
require 'dm-validations'  
require 'dm-migrations' 

configure :development, :test do
  DataMapper.setup :default, "sqlite://#{Dir.pwd}/database.db" 
end

configure :production do
  # Database connection
  # db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

  # ActiveRecord::Base.establish_connection(
  #   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  #   :host     => db.host,
  #   :username => db.user,
  #   :password => db.password,
  #   :database => db.path[1..-1],
  #   :encoding => 'utf8'
  # )

	require 'data_mapper'
	DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
end



class User  
    include DataMapper::Resource  
  
    property :id       , Serial  
    property :username , String  
    property :email    , String  
end 

DataMapper.auto_upgrade!

get '/' do
	"Hello There DatabaseFace"
	user = User.first
	user.username
end


