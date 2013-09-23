# -*- coding: utf-8 -*-

job_type :rake_utf8, "export LANG=zh_CN.UTF-8 && cd :path && :environment_variable=:environment bundle exec rake :task --silent :output"
set :output, "/Users/jim/Projects/Gstar/ground/logs/cron_log.log"
every 1.minutes do
  rake_utf8 "cron:check_latest_stars"
end
