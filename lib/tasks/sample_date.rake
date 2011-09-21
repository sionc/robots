namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do

	  50.times do
	    Robot.all(:limit => 1).each do |robot|
	      robot.microposts.create!(:content => Faker::Lorem.sentence(5))
	    end
	  end
  end
end