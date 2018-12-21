require './lib/message'

DataMapper.setup(:default, "postgres://localhost/message_app_#{ENV["RACK_ENV"]}")

DataMapper.finalize

if (ENV["RACK_ENV"]) == "test"
  DataMapper.auto_migrate!
else nil
end
