class Vendor < ActiveRecord::Base
  has_one :vendor_type
  has_one :cotton_billing
  has_one :silk_billing
  has_one :jari_billing
  has_one :jute_billing
  has_one :warp_billing
end
