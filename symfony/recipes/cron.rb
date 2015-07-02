node[:deploy].each do |app_name, deploy|
    if platform?("ubuntu")
        user = "www-data"
    elsif platform?("amazon")
        user = "apache"
    end

    node[app_name][:crons].each do |cron|
        cron "symfony-#{cron[:name]}" do
            minute cron[:minute] || '*'
            hour cron[:hour] || '*'
            day cron[:day] || '*'
            month cron[:month] || '*'
            weekday cron[:weekday] || '*'
            command "#{deploy[:deploy_to]}/current/app/console #{cron[:command]} --env=prod -vv >> #{deploy[:deploy_to]}/shared/log/cron.log"
            user user
        end
      end
end