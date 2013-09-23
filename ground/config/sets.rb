Ground do
  set :root, File.expand_path(File.dirname(File.dirname(File.dirname(__FILE__))))
  set :env, (ENV['RACK_ENV'] || 'development').to_s
  set :db_info, YAML.load_file(File.join(root, 'ground/config', 'database.yml'))[env]
  set :db, Sequel.connect(db_info)
  set :log_file, File.join(root, "ground/logs", "#{env}.log")
  set :logger, ::Logger.new(log_file)
end
