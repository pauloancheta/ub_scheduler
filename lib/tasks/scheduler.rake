namespace :scheduler do
  desc "hello world"
  task :weekly do
    Bamboohr::User.new.all
  end
end
