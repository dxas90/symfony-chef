node[:deploy].each do |app_name, deploy|
  execute "chmod -R g+w #{deploy[:deploy_to]}/current"
  execute "chmod -R g+w #{deploy[:deploy_to]}/shared/log"
end