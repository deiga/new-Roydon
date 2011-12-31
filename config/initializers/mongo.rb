MongoMapper.config = { 
  Rails.env => { 'uri' => ENV['MONGOHQ_URL'] || 
                          'mongodb://heroku_app2248510@ds029267.mongolab.com:29267/heroku_app2248510' } }

MongoMapper.connect(Rails.env)

if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect_to_master if forked
   end
end