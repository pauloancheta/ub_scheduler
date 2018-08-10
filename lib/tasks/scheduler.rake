namespace :scheduler do
  desc "hello world"
  task :weekly do
    Bamboohr::Timeoff.new.all_from_employee_id(40670)
  end
end
