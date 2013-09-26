# -*- coding: utf-8 -*-

job_type :rake_utf8, "export LANG=zh_CN.UTF-8 && cd :path && :environment_variable=:environment bundle exec rake :task --silent :output"

set :output, File.expand_path(File.join(File.dirname(__FILE__), '../', 'logs', "cron_log.log"))
every 1.minutes do
  rake_utf8 "cron:check_latest_stars"
end

every 1.minutes do
  rake_utf8 "cron:index_stars"
end

every 5.minutes do
  rake_utf8 "cron:clear_reindex_records"
end
