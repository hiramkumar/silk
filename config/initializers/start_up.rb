class StartUp
#  require 'rufus/scheduler'
#  scheduler = Rufus::Scheduler.start_new  
#
#scheduler.every '1d' do
#  Bank.update_old_orders
#end  

#puts 'asdhfjahsdjfhasdjfhjsdf'
#puts 'kasjdjdksfksdfalsdfjksd'
#
#scheduler.every '1d', :first_at => '2010/08/06 19:16' do
#  #ReportOpIpOutstanding.create_from_first_bill it will inster data from first bill date to current date - 1
#  #Below method will inster details from last run date to current date - 1
#  #ReportOpIpOutstanding.create_out_standing_report_for_cron
#  puts 'stated---------------------------------------------'
#end

#  scheduler.every("1m") do  
#    Hl7SentMessage.group_prescription_to_apollo 
#  end   
end
