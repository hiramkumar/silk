namespace :ram do
	desc "Display User"
	task :user => :environment do
		puts "User Name: #{pick(User).name}"
	end
	
	desc "Display Worker Type"
	task :type => :environment do
		
		puts "User Type  : #{pick(WorkerType).name}"
	end

	desc "Display User And Worker Type"
	task :all => [:user,:type]
	
	desc 'Add CopyRights to all view files'
  task :include_copyright_in_all_files do
    view_files = Dir["#{RAILS_ROOT.to_s}/app/views/workers/**/*"]
    view_files.each do |view|
      if (view.include?(".html.erb") || view.include?(".rhtml"))
        update_copyright_file(view)
      end
    end
  end
	
	def pick(model)
		model.find(:first,:order => 'id')
	end
	
	def update_copyright_file(view)
	  file_open = File.open(view,"r+")
	  lines = file_open.readlines
    file_open.close
    if lines[0].include?("<!-- Copyright @ 2012 Fiber Woven.\n")
      lines =  lines
    else
      lines = ["#{copyright}" + "\n"] + lines
    end
    output = File.new(view, "w")
	  lines.each { |line| output.write line }
    output.close
	end
	
	def copyright
	  copyright_name = "<!-- Copyright @ 2012 Fiber Woven.
This product includes software developed by Fiber Woven Tech.
All rights reserved --> "
	end
end
	
