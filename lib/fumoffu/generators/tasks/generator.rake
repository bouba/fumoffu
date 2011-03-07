namespace :fumoffu do
  desc "Test"
  task :test do
    File.open("#{Fumoffu::Generators::Application.template_dir}/actions/controller.rb.erb").each { |line|
      puts line
    }
  end
end