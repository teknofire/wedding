desc "Bootstrap the rails application"
task :bootstrap do
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].invoke
end
