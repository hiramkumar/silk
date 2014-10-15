require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env) if defined?(Bundler)
#require 'rails_development_boost'

module Rails3_Upgrade
  class Application < Rails::Application
    config.autoload_paths += [config.root.join('lib')]
    config.encoding = 'utf-8'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # See Rails::Configuration for more options.
    
    # Skip frameworks you're not going to use. To use Rails without a database
    # you must remove the Active Record framework.
    # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
    #  config.gem "thoughtbot-shoulda", :lib => "shoulda",:source => "http://gems.github.com"
    # Specify gems that this application depends on. 
    # They can then be installed with "rake gems:install" on new installations.
    # config.gem "bj"
    # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
    # config.gem "aws-s3", :lib => "aws/s3"
    #config.gem "parseexcel"
    # uncomment next line in development mode if u have installed development booster gem
    #config.gem 'development-booster', :lib => 'rails-dev-boost -lib.rb'
    # Only load the plugins named here, in the order given. By default, all plugins 
    # in vendor/plugins are loaded in alphabetical order.
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :exception_notification, :ssl_requirement, :all ]
    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{RAILS_ROOT}/extras )
    
    # Force all environments to use the same logger level
    # (by default production uses :info, the others :debug)
    # config.log_level = :debug
    
    # Make Time.zone default to the specified zone, and make Active Record store time values
    # in the database in UTC, and return them converted to the specified local zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Uncomment to use default local time.
    # config.time_zone = 'UTC'
    #config.time_zone = 'UTC'
    #  if RAILS_GEM_VERSION != '2.2.2'    
    #  config.time_zone = 'New Delhi'
    # end
    
    
    # Your secret key for verifying cookie session data integrity.
    # If you change this key, all old sessions will become invalid!
    # Make sure the secret is at least 30 characters and all random, 
    # no regular words or you'll be exposed to dictionary attacks.
   # config.action_controller.session = {
  config.secret_token = 'srishtidsfjdkfabcdabcdabcdjlsdkfsdfjskdfj'
  config.action_controller.session = {
     :session_key => '_test_session',
     :secret      => '0c46102a75631f404917b155bad5ce7973e7ff9727e23612f18340bdeba6f3de7866a95785cafabc1f481b7b3412d4f0f09a11b32504f22c894d197f8ef7a4e2'
    }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings  = {
                    :address => "192.168.1.1",
                    :port => 25,
                    :domain => "sarvgya.srishti"
    } 
    config.active_record.timestamped_migrations = false
    
    
    # Use the database for sessions instead of the cookie-based default,
    # which shouldn't be used to store highly confidential information
    # (create the session table with "rake db:sessions:create")
     config.action_controller.session_store = :active_record_store
    
    # Use SQL instead of Active Record's schema dumper when creating the test database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql
    
    # Activate observers that should always be running
    # config.active_record.observers = :cacher, :garbage_collector
  end
  
  #ExceptionNotifier.exception_recipients = %w(srinivasarao@srishtisoft.com dipti@srishtisoft.com jagannath@srishtisoft.com)
  #ExceptionNotifier.exception_recipients = %w(suhana@srishtisoft.com srinivasarao@srishtisoft.com khaleshah@srishtisoft.com)
  #ExceptionNotifier.sender_address = %("Paras" <app.error@paras.com>) 
  
  #require 'will_paginate'
  #gem 'has_finder'
  #require 'has_finder'
  require 'active_support/inflector'
  #require "worksheet"
  # Added By Sujith For Edms #
  COMP_OFF = 5;
  LOSS_OF_PAY = 9;
  # end #
  
  # Production Log Analyzer
  # require 'syslog_logger'
  #  RAILS_DEFAULT_LOGGER = SyslogLogger.new
  #RAILS_DEFAULT_LOGGER ||= Logger.new("#{RAILS_ROOT}/log/#{RAILS_ENV}.log")
  
  COMMISSION_PERCENTAGE_FOR_CARD_PAYMENT = 2.0
  
  # The following Code is the Monkey Patch for logging the DB time in the log files.
  #### Start Log Patch  ####
  module ActiveRecord
    module ConnectionAdapters
      class AbstractAdapter
        protected
        def log(sql, name)
          if block_given?
            # RSI: changed to get DB statistics in log file at info level
            # if @logger and @logger.debug?
            if @logger and @logger.level <= Logger::INFO
              result = nil
              seconds = Benchmark.realtime { result = yield }
              @runtime += seconds
              log_info(sql, name, seconds)
              result
            else
              yield
            end
          else
            log_info(sql, name, 0)
            nil
          end
        rescue Exception => e
          # Log message and raise exception.
          # Set last_verification to 0, so that connection gets verified
          # upon reentering the request loop
          @last_verification = 0
          message = "#{e.class.name}: #{e.message}: #{sql}"
          log_info(message, name, 0)
          raise ActiveRecord::StatementInvalid, message
        end
      end
    end
  end
  
  
  
  require 'date'
  
  
  module ActiveSupport #:nodoc:
    module CoreExtensions #:nodoc:
      module String #:nodoc:
        # Converting strings to other objects
        module Conversions
          # 'a'.ord == 'a'[0] for Ruby 1.9 forward compatibility.
          
          def to_date
            if Ambient.conf.get(:usa_date_format) == true
              s = self.split('-')
              year = s[2]
              month = s[0]
              day = s[1]
              default_format = "#{year}-#{month}-#{day}"
              #raise default_format.inspect
            else
              default_format = self
            end
            ::Date.new(*::Date._parse(default_format, false).values_at(:year, :mon, :mday))
          end
          
          
        end
      end
    end
  end
end
