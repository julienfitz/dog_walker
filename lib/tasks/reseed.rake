namespace :db do
  
  desc "Drop, create, migrate then seed the development database"
  task reseed: [
    'environment',  
    'db:drop', 
    'db:create', 
    'db:migrate', 
    'db:seed'
  ]
end