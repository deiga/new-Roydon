credentials = YAML.load_file('config/db.credentials.yml')['Development']
user = credentials['user']
pwd = credentials['password']
MongoMapper.config = { 
  Rails.env => { 'uri' => ENV['MONGOHQ_URL'] || 
                          "mongodb://#{user}:#{pwd}@ds029267.mongolab.com:29267/heroku_app2248510" } }

MongoMapper.connect(Rails.env)

if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect_to_master if forked
   end
end