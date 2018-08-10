namespace :scheduler do
  desc "hello world"
  task :weekly do
    OpsGenie::OnCall.new.call("core")
  end
end
