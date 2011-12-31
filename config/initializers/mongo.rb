env = 'Development'
if Rails.env.test?
	env = 'Test'
end

credentials = YAML.load_file('config/db.credentials.yml')[env]
user = credentials['user']
pwd = credentials['password']
db = credentials['database']
url = credentials['url']
MongoMapper.config = { 
  Rails.env => { 'uri' => ENV['MONGOHQ_URL'] || 
                          "mongodb://#{user}:#{pwd}@#{url}/#{db}" } }

MongoMapper.connect(Rails.env, :logger => Rails.logger)

if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect_to_master if forked
   end
end