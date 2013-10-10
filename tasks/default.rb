task "Default task resets sets up the database"
task :default do
  ENV["ENV"] = "testing"
  Rake::Task["db:create"].execute
  Rake::Task["db:migrate"].execute
  Rake::Task["db:seed"].execute
end