namespace :scheduler do
  desc "hello world"
  task :weekly do
    puts Bamboohr::User.new.call
  end
end
