# frozen_string_literal: true

desc 'Test docker images'
task :test do
  puts '*** Testing images ***'.green
  $images.each do |image|
    puts "Running tests on #{image.build_tag}"
    sh "docker run --rm  -e AUTH_TOKEN=test1234 -e PROXY_ADDR=test.fake.ca -e PROXY_PORT=80 #{image.build_tag} /bin/sh -c \"echo hello from #{image.build_tag}\""
  end
end
