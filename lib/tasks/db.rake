namespace :db do

	desc "clear the databse"
	task :clear => :environment do 
		User.delete_all
		Group.delete_all
		UsersGroup.delete_all
	end
	
end