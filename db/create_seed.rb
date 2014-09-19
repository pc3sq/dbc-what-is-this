require "Faker"

data = {}

data['users'] = {
              'name' => [],
              'email' => [],
              'password' => [],
                }

data['questions'] = {
                  "title" => [],
                  'caption' => [],
                    }

data['responses'] = {
                  'content' => [],
                    }

data['comments'] = {
                  'body' => [],
                    }

10.times do
  data['users']['name'] << Faker::Name.name
  data['users']['email'] << Faker::Internet.email
  data['users']['password'] <<Faker::Internet.password
  data['questions']['title'] << Faker::Lorem.words(3).join(' ')
  data['questions']['caption'] << Faker::Lorem.sentence
  data['responses']['content']<<  Faker::Lorem.sentence
  data['comments']['body'] << Faker::Lorem.sentence
end
data['users']['name'] << "Admin"
  data['users']['email'] << "admin@admin.com"
  data['users']['password'] << "admin"

File.write('seed.yml', YAML.dump(data))