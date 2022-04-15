require_relative './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup(name: 'bookmark_manager_test')
else
  DatabaseConnection.setup(name: 'bookmark_manager')
end
