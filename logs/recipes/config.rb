template '/tmp/cwlogs.cfg' do
  source 'cwlogs.cfg.erb'
  owner 'root'
  group 'root'
  mode 0o644
end
