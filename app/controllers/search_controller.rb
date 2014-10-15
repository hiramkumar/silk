class SearchController < ApplicationController
  require 'will_paginate/array'
  
  def search_weaver
    @looms = Loom.find(:all)
  end
  
  def view_weaver
    name = params[:weaver][:name]
    id   = params[:weaver][:id].to_i
    address = params[:weaver][:address]
    ph_no= params[:weaver][:ph_no]
    conditions = []
    conditions << "(first_name ilike '%%#{name}%%' or last_name ilike '%%#{name}%%')" if params[:weaver][:name] !=""
    conditions << "(id = #{id})" if params[:weaver][:id] !=""
    conditions << "(address1 ilike '%%#{address}%%' or address2 ilike '%%#{address}%%')" if params[:weaver][:address] !=""
    conditions << "(phone_no ilike '%%#{ph_no}%%')" if params[:weaver][:ph_no] !=""
    conditions << "(worker_type_id = 1)"
      sql = conditions.join(" and ")
      if sql != ""
        @workers = Worker.find_by_sql("select * from workers where #{sql}")
      else
        @workers = Worker.find(:all,:conditions =>["worker_type_id = 1"])
      end
        
  end
  
  def show_weaver
    @worker =  params[:worker_id].to_i
    @looms = Loom.find(:all,:conditions =>["worker_id = ?",@worker])
  end
  
  def search_dyer
    @dyes = Dye.find(:all)
  end
  
  def view_dyer
    name = params[:weaver][:name]
    id   = params[:weaver][:id].to_i
    address = params[:weaver][:address]
    ph_no= params[:weaver][:ph_no]
    conditions = []
    conditions << "(first_name ilike '%%#{name}%%' or last_name ilike '%%#{name}%%')" if params[:weaver][:name] !=""
    conditions << "(id = #{id})" if params[:weaver][:id] !=""
    conditions << "(address1 ilike '%%#{address}%%' or address2 ilike '%%#{address}%%')" if params[:weaver][:address] !=""
    conditions << "(phone_no ilike '%%#{ph_no}%%')" if params[:weaver][:ph_no] !=""
    conditions << "(worker_type_id = 2)"
      sql = conditions.join(" and ")
      if sql != ""
        @workers = Worker.find_by_sql("select * from workers where #{sql}")
      else
        @workers = Worker.find(:all,:conditions =>["worker_type_id = 2"])
      end
    
  end
  
  def show_dyer
    @worker =  params[:worker_id].to_i
    @dyes = Dye.find(:all,:conditions =>["worker_id = ?",@worker])
  end
  
  def search_vendor
    @vendors = Vendor.find(:all)
    @vendor_types = VendorType.find(:all)
  end
  
  def view_vendor
    
    type = params[:vendor][:type].to_i
    vendor = params[:weaver][:vendor]
    name = params[:weaver][:name]
    id   = params[:weaver][:id].to_i
    address = params[:weaver][:address]
    ph_no= params[:weaver][:ph_no]
    conditions = []
    conditions << "(name ilike '%%#{vendor}%%')" if params[:weaver][:vendor] !=""
    conditions << "(person_name ilike '%%#{name}%%')" if params[:weaver][:name] !=""
    conditions << "(id = #{id})" if params[:weaver][:id] !=""
    conditions << "(address ilike '%%#{address}%%' )" if params[:weaver][:address] !=""
    conditions << "(phone_no ilike '%%#{ph_no}%%')" if params[:weaver][:ph_no] !=""
    conditions << "(vendor_type_id  = #{type})" if params[:vendor][:type] != ""
      sql = conditions.join(" and ")
      if sql != ""
        @workers = Vendor.find_by_sql("select * from vendors where #{sql}")
      else
        @workers = Vendor.find(:all)
      end
  end
  
  def show_vendor
  
    @worker = params[:worker_id].to_i
    @type = Vendor.find_by_id(@worker)
    if @type.vendor_type_id == 1
      @vendor = SilkBilling.find(:all,:order =>"id",:conditions =>["vendor_id =?",@worker])
      elsif @type.vendor_type_id == 2
        @vendor = JariBilling.find(:all,:order =>"id",:conditions =>["vendor_id =?",@worker])
        elsif @type.vendor_type_id == 3
          @vendor = CottonBilling.find(:all,:order =>"id",:conditions =>["vendor_id =?",@worker])
          elsif @type.vendor_type_id == 4
            @vendor = JuteBilling.find(:all,:order =>"id",:conditions =>["vendor_id =?",@worker])
            elsif @type.vendor_type_id == 5
              @vendor = WarpBilling.find(:all,:order =>"id",:conditions =>["vendor_id =?",@worker])
              elsif @type.vendor_type_id == 6
                @vendor = Designer.find(:all,:order =>"id",:conditions =>["vendor_id =?",@worker])
    end
    
  end
  
end
