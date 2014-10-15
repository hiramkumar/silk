class Worker < ActiveRecord::Base
  has_one :title
  has_one :loom
  has_one :dye
  has_one :worker_type
  validates_presence_of :first_name, :last_name,:address1,:address2,:phone_no

end
