# Copyright © 2005-2010 Srishti Software Applications Pvt Ltd.
# This product includes software developed by Srishti Software Applications Pvt ltd.
# All rights reserved

# Load the rails application
require File.expand_path('../application', __FILE__)


# Initialize the rails application
Rails3_Upgrade::Application.initialize!
ActiveRecord::Base.include_root_in_json = false
