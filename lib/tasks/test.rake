require 'yaml'

task test: ['key_resources:setup:config_files', :environment, :'vite:build'] do
  Dir.glob('./test/**/*_test.rb').each { |file| require file }
end
