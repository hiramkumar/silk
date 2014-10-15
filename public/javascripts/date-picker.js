/* ANSI Datepicker Calendar - David Lee 2005

  david [at] davelee [dot] com [dot] au

  project homepage: http://projects.exactlyoneturtle.com/date_picker/

  License:
  use, modify and distribute freely as long as this header remains intact;
  please mail any improvements to the author
*/
/* added for auto fill date */
function set_onkeydown_date()
{
$$('a').concat($$('img')).each(function(elem_img){
	var split_elements = elem_img.id.split('_link');
	if (split_elements.length>1)
	{
		var element_id = split_elements[0].slice(1,split_elements[0].length)
		$(element_id).setAttribute('onkeypress',"return birthdate(this,event,'dob')");
        $(element_id).removeAttribute('readonly');
		if ($(element_id).getAttribute('onkeydown')==null)
        	$(element_id).setAttribute('onkeydown',"return ValidatebirthDate(this,event,'')");
		
		if ($(element_id).getAttribute('onchange')==null)
        $(element_id).setAttribute('onchange',"return isDate(this);");
	}
});
}
/*ends here*/
function check()
    {
        var a=document.getElementById("name").value;
        document.getElementById("registration_date").value=a;
            

    }
var DatePicker = {
  version: 0.31,

  /* Configuration options */

  // if false, hide last row if empty
  constantHeight: true,

  // show select list for year?
  useDropForYear: false,

  // show select list for month?
  useDropForMonth: false,

  // number of years before current to show in select list
  yearsPriorInDrop: 10,

  // number of years after current to show in select list
  yearsNextInDrop: 10,

  // The current year
  year: new Date().getFullYear(),
  
  // The first day of the week (0=Sunday, 1=Monday, ...)
  firstDayOfWeek: 0,

  // show only 3 chars for month in link
  abbreviateMonthInLink: true,

  // show only 2 chars for year in link
  abbreviateYearInLink: false,

  // eg 1st
  showDaySuffixInLink: false,

  // eg 1st; doesn't play nice w/ month selector
  showDaySuffixInCalendar: false,

  // px size written inline when month selector used
  largeCellSize: 22,

  // if set, choosing a day will send the date to this URL, eg 'someUrl?date='
  urlBase: null,

  // show a cancel button to revert choice
  showCancelLink: true,
  //show current time
  showTime: true,

  // stores link text to revert to when cancelling
  _priorLinkText: [],

  // stores date before datepicker to revert to when cancelling
  _priorDate: [],

  months: 'January,February,March,April,May,June,July,August,September,October,November,December'.split(','),

  days: 'Sun,Mon,Tue,Wed,Thu,Fri,Sat'.split(','),
  
    //For Geting the Today's Appointment
  AJToday: '',

  /* Method declarations */

  toggleDatePicker: function (id) {
    var calendar = this.findCalendarElement(id);
    if (calendar.style.display == 'block' && id!='crossmatch_detail_date' && id!="corporate_validity_date" && id!="pat_wise_from" && id!="dependent_dob" && id!='valid_till_date' && id!="pat_wise_to" && id!='return_date' && id!='issue_return_date' && id!='dvd_donation_date' && id != 'issue_date' && id != 'ct_bill_date' && id != 'date_of_birth' && id != 'issue_match_date' && id != 'recipient_detail_request_date' && id != 'issue_cross_date' && id!='match_date'  && id != 'request_date1'  && id != 'request_date' && id!= 'lab_request_report' && id!= 'op_daily_lab' && id!= 'op_daily_lab1' && id!='recipient_date' && id!= 'reserve_date' && id != 'cross_date' && id != 'app' && id != 'maincal' && id != 'otmanager' && id != 'dayviewcal' && id != 'timecal' && id != 'surgerycal' && id != 'surgerycalender' && id != 'cssdcal' && id != 'requestcal' && id != 'pending_bill_entry' && id != 'pending_bill_entry_billing' && id != 'referral_doctor_entry' && id!='doctor_unavailable_entry' && id!='doctor_unavailable_entry1' && id!='consult_bill_entry' && id!='query_visit') {  // If showing, hide
      calendar.style.display = 'none'; 
            
        }
        else { // Else, show
	  
      calendar.style.display = 'block';
      this._priorLinkText[id] = this.findLinkElement(id).innerHTML;
      this._priorDate[id] = document.getElementById(id).value;
      this.writeCalendar(id);
      if(id == 'otmanager')
        {
            if (document.getElementById(id).value == '')
            {
                var pars = "date="+this.AJToday;
               var myAjax = new Ajax.Updater('view_billed_surgery_list','/ot_scheduling/ot_manager/view_billed_surgery_list',{method: 'get', parameters: pars});
 //              el.scrollIntoView(true);
          
            }
             else
            { 
                var pars = "date="+document.getElementById(id).value;
               var myAjax = new Ajax.Updater('view_billed_surgery_list','/ot_scheduling/ot_manager/view_billed_surgery_list',{method: 'get', parameters: pars});
  //             el.scrollIntoView(true);
           }
       }
              
      if(id == 'timecal')
        {
            if (document.getElementById(id).value == '')
            {
                var pars = "date="+this.AJToday;
    	var myAjax = new Ajax.Updater('docdetail','/appointment/appointments/doctor_detail_for_time_analysis',{method: 'get', parameters: pars});     	
    	var myAjax = new Ajax.Updater('time_analysis','/appointment/appointments/time_analysis',{method: 'get', parameters: pars});     	
//              el.scrollIntoView(true);
          
            }
             else
            { 
                var pars = "date="+document.getElementById(id).value;
    	var myAjax = new Ajax.Updater('docdetail','/appointment/appointments/doctor_detail_for_time_analysis',{method: 'get', parameters: pars});     	
    	var myAjax = new Ajax.Updater('time_analysis','/appointment/appointments/time_analysis',{method: 'get', parameters: pars});
           }
       }
       if(id == 'dayviewcal')
       {
           
           if (document.getElementById(id).value == '')
            {
                var pars = "date="+this.AJToday;
               var myAjax = new Ajax.Updater('dayview','/appointment/appointments/doctor_day_view',{method: 'get', parameters: pars});
                         
            }
             else
            { 
                var pars = "date="+document.getElementById(id).value;
               var myAjax = new Ajax.Updater('dayview','/appointment/appointments/doctor_day_view',{method: 'get', parameters: pars});
              
           }  
       }
       if(id == 'surgerycal')
       {
           
           if (document.getElementById(id).value == '')
            {
                var pars = "date="+this.AJToday;
               var myAjax = new Ajax.Updater('surgery_list','/ot_scheduling/ot_schedules/surgery_list',{method: 'get', parameters: pars});
                         
            }
             else
            { 
                var pars = "date="+document.getElementById(id).value;
               var myAjax = new Ajax.Updater('surgery_list','/ot_scheduling/ot_schedules/surgery_list',{method: 'get', parameters: pars});
              
           }  
       }

       if(id == 'surgerycalender')
       {
           
           if (document.getElementById(id).value == '')
            {
              var pars = "date="+this.AJToday;
              var myAjax = new Ajax.Updater('ot','/ot_scheduling/ot_schedules/ot_heading',{method: 'get', parameters: pars});     	                
              var myAjax = new Ajax.Updater('surgery_list','/ot_scheduling/ot_schedules/today_appointments',{method: 'get', parameters: pars});                          
            }
             else
            { 
                var pars = "date="+document.getElementById(id).value;
              var myAjax = new Ajax.Updater('ot','/ot_scheduling/ot_schedules/ot_heading',{method: 'get', parameters: pars});     	                
              var myAjax = new Ajax.Updater('surgery_list','/ot_scheduling/ot_schedules/today_appointments',{method: 'get', parameters: pars});                                        
           }  
       }       
       
       if(id == 'requestcal')
       {
           
           if (document.getElementById(id).value == '')
            {
                var pars = "date="+this.AJToday;
               var myAjax = new Ajax.Updater('viewrequest','/cssd/cssd/view_pack_requests',{method: 'get', parameters: pars});
                         
            }
             else
            { 
                var pars = "date="+document.getElementById(id).value;
               var myAjax = new Ajax.Updater('viewrequest','/cssd/cssd/view_pack_requests',{method: 'get', parameters: pars});
              
           }  
       }
       if(id == 'cssdcal')
       {
           
           if (document.getElementById(id).value == '')
            {
                var pars = "date="+this.AJToday;
               var myAjax = new Ajax.Updater('cssdlist','/cssd/cssd/view_surgery_list',{method: 'get', parameters: pars});
                         
            }
             else
            { 
                var pars = "date="+document.getElementById(id).value;
               var myAjax = new Ajax.Updater('cssdlist','/cssd/cssd/view_surgery_list',{method: 'get', parameters: pars});
              
           }  
       }
     }  
	 
  },
 
  cancel: function (id) {
    this.findLinkElement(id).innerHTML = this._priorLinkText[id];
    document.getElementById(id).value = this._priorDate[id];
    this.findCalendarElement(id).style.display = 'none';
  },

  // mitigate clipping when new month has less days than selected date
  unclipDates: function (d1, d2) {
    if (d2.getDate() != d1.getDate()) {
      d2 = new Date(d2.getFullYear(), d2.getMonth(), 0);
    }

    return d2;
  },

  // change date given an offset from the current date as a number of months (+-)
  changeCalendar: function (id, offset) {
    var d1 = this.getSelectedDate(id), d2;
    if (offset % 12 == 0) { // 1 year forward / back (fix Safari bug)
      d2 = new Date (d1.getFullYear() + offset / 12, d1.getMonth(), d1.getDate() );
    } else if (d1.getMonth() == 0 && offset == -1) {// tiptoe around another Safari bug
      d2 = new Date (d1.getFullYear() - 1, 11, d1.getDate() );
    } else {
      d2 = new Date (d1.getFullYear(), d1.getMonth() + offset, d1.getDate() );
    }

    d2 = this.unclipDates(d1, d2);
    ansi_date = d2.getDate() + '-' + (d2.getMonth() + 1) + '-' + d2.getFullYear();
    this.setDate(id, ansi_date);
    this.writeCalendar(id);
  },

  setDate: function (id, ansiDate) {  
    var d_day  = (this.showDaySuffixInLink ? this.formatDay(ansiDate.split('-')[0]) : ansiDate.split('-')[0]);
    var d_year = (this.abbreviateYearInLink ? ansiDate.split('-')[2].substring(2,4) : ansiDate.split('-')[2]);
    var d_mon  = this.getMonthName(Number(ansiDate.split('-')[1])-1);
    if (this.abbreviateMonthInLink) { d_mon = d_mon.substring(0, 3); }
	sr_day = ansiDate.split('-')[0]
	sr_month = ansiDate.split('-')[1]
	var day = (sr_day< 10) ? '0' + sr_day : sr_day;
	var month = (sr_month< 10) ? '0' + sr_month : sr_month;
    sr_date =  day+"-"+month+"-"+ansiDate.split("-")[2]
	document.getElementById(id).value = sr_date;
    document.getElementById(id).focus();
	document.getElementById(id).select();
  },

  pickDate: function (id, ansi_date) {
    this.setDate(id, ansi_date);
    this.toggleDatePicker(id);
    if (this.urlBase) {
      document.location.href = this.urlBase + ansi_date
    }
	
/* Added for appointment */	

	if(id == 'maincal')
        {
			$('_maincal_calendar').style.display = 'none';
            if (document.getElementById(id).value == '')
            {
                var pars = "date="+this.AJToday;
               var myAjax = new Ajax.Updater('todayapp','/appointment/appointments/today_appointments',{method: 'get', parameters: pars});
                var myAjax = new Ajax.Updater('doctor','/appointment/appointments/doctor_detail',{method: 'get', parameters: pars});
               var el = document.getElementById('08AM');
 //              el.scrollIntoView(true);
            }
             else
            { 
               var pars = "date="+document.getElementById(id).value+"&sch_ent_id="+$F('schedule_id')+"&type="+$F('schedule_type');
               var myAjax = new Ajax.Updater('todayapp','/appointment/appointments/today_appointments',{method: 'get', parameters: pars});
               var myAjax = new Ajax.Updater('doctor','/appointment/appointments/doctor_detail',{method: 'get', parameters: pars});     
               var el = document.getElementById('08AM');
  //             el.scrollIntoView(true);
           }
       }

/* End Here*/
	
/* added for Blood bank*/
if (id == 'request_date') {
            $('_request_date_calendar').style.display = 'none';
            if (document.getElementById(id).value == '') {
                var pars = "date=" + this.AJToday;
                var myAjax = new Ajax.Updater('request_detail', '/lab/op_lab/requestlist', {
                    method: 'get',
                    parameters: pars
                });
                
            }
            else {
                var pars = "date=" + document.getElementById(id).value;
                var myAjax = new Ajax.Updater('request_detail', '/lab/op_lab/requestlist', {
                    method: 'get',
                    parameters: pars
                });
                
            }
        }
		       
		       if (id == 'pat_wise_from') {
            $('_pat_wise_from_calendar').style.display = 'none';
            var fromdate = $('pat_wise_from').value
            var todate = $('pat_wise_to').value
            type=0;
            if ($('patient_wise_value_ai_all').checked==true)
                {
                    type = 1;
                }
                else if ($('patient_wise_value_ai_individual').checked==true)
                {
                    type = 2;
                }
                   pat=0;
            if ($('patient_wise_value_ai_all').checked==true)
                {
                    pat = 1;
                }
                else if ($('patient_wise_value_ai_individual').checked==true)
                {
                    pat = 2;
                }
            if (document.getElementById(id).value == '') {
                var pars = "pat_wise_fromdate=" + this.AJToday;
                var myAjax = new Ajax.Updater('pat_wise_donor', '/bloodbank/receipient/patient_wise_donor_list', {
                    method: 'get',
                    parameters: pars
                });
            }
            else {
                var pars = "pat_wise_fromdate=" + document.getElementById(id).value+"&to="+todate+"&select="+type+"&pattype="+pat;
                var myAjax = new Ajax.Updater('pat_wise_donor', '/bloodbank/receipient/patient_wise_donor_list', {
                    method: 'get',
                    parameters: pars
                });
            }
        }
           if (id == 'pat_wise_to') {
            $('_pat_wise_to_calendar').style.display = 'none';
            var fromdate = $('pat_wise_from').value
            var todate = $('pat_wise_to').value
            type=0;
            if ($('patient_wise_value_ai_all').checked==true)
                {
                    type = 1;
                }
                else if ($('patient_wise_value_ai_individual').checked==true)
                {
                    type = 2;
                }
                           pat=0;
            if ($('patient_wise_value_io_op').checked==true)
                {
                    pat = 1;
                }
                else if ($('patient_wise_value_io_ip').checked==true)
                {
                    pat = 2;
                }
            if (document.getElementById(id).value == '') {
                var pars = "pat_wise_todate=" + this.AJToday;
                var myAjax = new Ajax.Updater('pat_wise_donor', '/bloodbank/receipient/patient_wise_donor_list', {
                    method: 'get',
                    parameters: pars
                });
            }
            else {
                var pars = "pat_wise_todate=" + document.getElementById(id).value+"&from="+fromdate+"&select="+type+"&pattype="+pat;
                var myAjax = new Ajax.Updater('pat_wise_donor', '/bloodbank/receipient/patient_wise_donor_list', {
                    method: 'get',
                    parameters: pars
                });
            }
        }
		if (id == 'dependent_dob') {
	        
            $('_dependent_dob_calendar').style.display = 'none';
            if (document.getElementById(id).value == '') {
                var value = this.AJToday;
                calculateAge($(id))
            }
            else {
                var value = document.getElementById(id).value;
                calculateAge($(id))
            }
	}       
		       
		       
		        if (id == 'issue_date') {
            $('_issue_date_calendar').style.display = 'none';
            if (document.getElementById(id).value == '') {
                var pars = "date=" + this.AJToday;
                var myAjax = new Ajax.Updater('issue_detail', '/bloodbank/receipient/issuelist', {
                    method: 'get',
                    parameters: pars
                });
                
            }
            else {
                var pars = "date=" + document.getElementById(id).value;
                var myAjax = new Ajax.Updater('issue_detail', '/bloodbank/receipient/issuelist', {
                    method: 'get',
                    parameters: pars
                });
                
            }
        }
		      if (id == 'date_of_birth') {
            $('_date_of_birth_calendar').style.display = 'none';
            var now = new Date();
            birthdate = $('date_of_birth').value
            var byear = birthdate.split('-')[2]
            var bmonth = birthdate.split('-')[1] - 1
            var bdate = birthdate.split('-')[0]
            var birthdate = new Date(parseInt(byear), parseInt(bmonth), parseInt(bdate))
            var today = new Date()
            var one_day = 1000 * 60 * 60 * 24
            days = Math.ceil((today.getTime() - birthdate.getTime()) / (one_day))
            agedays = parseInt((days / 365))
            //if (agedays < 18 || agedays > 60)
            //{
            //    alert('Age should not be less than 18yrs and more than 60 yrs')
            //    $('date_of_birth').value = ''
            //    $('age').value=''
            //}
            //else
            //{
             $('age').value = agedays
            //}
        }
        
         if (id == 'edit_date_of_birth') {
            $('_edit_date_of_birth_calendar').style.display = 'none';
            var now = new Date();
            birthdate = $(edit_date_of_birth).value
            doantion_date = $(dvd_donation_date).value
            var byear = birthdate.split('-')[2]
            var bmonth = birthdate.split('-')[1] - 1
            var bdate = birthdate.split('-')[0]
            var birthdate = new Date(parseInt(byear), parseInt(bmonth), parseInt(bdate))
            var dyear = doantion_date.split(' ')[0].split('-')[2]
            var dmonth = doantion_date.split(' ')[0].split('-')[1] - 1
            var ddate = doantion_date.split(' ')[0].split('-')[0]
            var dondate = new Date(parseInt(dyear), parseInt(dmonth), parseInt(ddate))
           // var today = new Date()
            var one_day = 1000 * 60 * 60 * 24
            days = Math.ceil((dondate.getTime() - birthdate.getTime()) / (one_day))
           agedays = parseInt((days / 365))
            if (agedays < 18 || agedays > 60)
            {
                alert('Age should be within 18 and 60yrs')
                $('edit_date_of_birth').value = $('d_date').value
                $('age').value=$('d_age').value
            }
            else
            {
            //alert('test')
             $('age').value = agedays
            }
            
            
        }
        
        
                         if (id == 'crossmatch_detail_date') {
            $('_crossmatch_detail_date_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
            var recdate = $('recipient_date').value
            var crossdate = $('crossmatch_detail_date').value 
            crossdate = new Date(crossdate.split('-')[2], crossdate.split('-')[1] - 1, crossdate.split('-')[0])
            recipeintdate = new Date(recdate.split('-')[2], recdate.split('-')[1] - 1, recdate.split('-')[0])
                if (recipeintdate <= crossdate) {
                    return true;
                }
                else {
            alert('Request Date should be less than or equal to Cross match date')
                    var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('crossmatch_detail_date').value = todaydate
                    return false;
                }
            }
            
        }
		
	   if (id == 'issue_return_date') {
            $('_issue_return_date_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
                var issue_return = $('issue_return_date').value
                var time = new Date();
                var year = time.getFullYear();
                var month = time.getMonth();
                var day = time.getDate();
                var issuedate = new Date(issue_return.split('-')[2], issue_return.split('-')[1] - 1, issue_return.split('-')[0])
                var start_date = Date.UTC(year, month, day);
                var a = start_date - (1000 * 60 * 60 * 24 * 7)
                var b = start_date + (1000 * 60 * 60)
                if (issuedate < a) {
                        alert('Issue Date Should not be less than one week ')
					var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('issue_return_date').value = todaydate
                    $('issue_return_date').focus();
                       $('return_date').value = $(id).value;
                        $('blood_issue_return_detail_patient_name').value = '';
                        $('blood_issue_return_detail_patient_code').value = '';
                        $('blood_issue_return_detail_component').value = '';
                        $('blood_issue_return_detail_issued_by').value = '';
                        $('blood_issue_return_detail_rep_name').value = '';
                        $('blood_issue_return_detail_age').value = '';
                        $('blood_issue_return_detail_sex').value = '';
                        $('blood_issue_return_detail_blood_group').value = '';
                        $('blood_issue_return_detail_room_number').value = '';
                        $('blood_issue_return_detail_unit_number').value = '';
                        $('issue_on').value = '';
                        $('show_message').innerHTML = ''
                    return false;
                }
                else 
                    if (issuedate >= b) {
                        alert('Issue Date Should not be greater than current date ')
					var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('issue_return_date').focus();
                    $('issue_return_date').value = todaydate
                       $('return_date').value = $(id).value;
                        $('blood_issue_return_detail_patient_name').value = '';
                        $('blood_issue_return_detail_patient_code').value = '';
                        $('blood_issue_return_detail_component').value = '';
                        $('blood_issue_return_detail_issued_by').value = '';
                        $('blood_issue_return_detail_rep_name').value = '';
                        $('blood_issue_return_detail_age').value = '';
                        $('blood_issue_return_detail_sex').value = '';
                        $('blood_issue_return_detail_blood_group').value = '';
                        $('blood_issue_return_detail_room_number').value = '';
                        $('blood_issue_return_detail_unit_number').value = '';
                        $('issue_on').value = '';
                        $('show_message').innerHTML = ''
                        return false;
                    }
                    else {
                    var pars = "date=" + document.getElementById(id).value;
                    var myAjax = new Ajax.Updater('issue_date', '/bloodbank/receipient/issue_return_list', {
                    method: 'get',
                    parameters: pars
                });
                       $('return_date').value = $(id).value;
                        $('blood_issue_return_detail_patient_name').value = '';
                        $('blood_issue_return_detail_patient_code').value = '';
                        $('blood_issue_return_detail_component').value = '';
                        $('blood_issue_return_detail_issued_by').value = '';
                        $('blood_issue_return_detail_rep_name').value = '';
                        $('blood_issue_return_detail_age').value = '';
                        $('blood_issue_return_detail_sex').value = '';
                        $('blood_issue_return_detail_blood_group').value = '';
                        $('blood_issue_return_detail_room_number').value = '';
                        $('blood_issue_return_detail_unit_number').value = '';
                        $('issue_on').value = '';
                        $('show_message').innerHTML = ''
                        return true;
                    }
            }
        }
        
        if (id == 'return_date') {
            $('_return_date_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
                var issuereturn = $('return_date').value
                var issue = $('issue_return_date').value
                return_date = new Date(issuereturn.split('-')[2], issuereturn.split('-')[1] - 1, issuereturn.split('-')[0])
                issue_date = new Date(issue.split('-')[2], issue.split('-')[1] - 1, issue.split('-')[0])
                if (return_date < issue_date) {
                    alert('Select Proper Date')
					var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('return_date').value = todaydate
                    return false;
                }
                else 
                {
                    return true;
                }
            }
        }

		     if (id == 'recipient_date') {
            $('_recipient_date_calendar').style.display = 'none';
            $('doncomp').innerHTML = "";
            $('comp_load').innerHTML = "";
            $('load_group').innerHTML = "";
            $('divid').innerHTML = "";
            var recdate = $('recipient_date').value
            var crossdate = $('crossmatch_detail_date').value 
            crossdate = new Date(crossdate.split('-')[2], crossdate.split('-')[1] - 1, crossdate.split('-')[0])
            recipeintdate = new Date(recdate.split('-')[2], recdate.split('-')[1] - 1, recdate.split('-')[0])
            if (recipeintdate <= crossdate)           
            {
            if (document.getElementById(id).value == '') {
                var pars = "date=" + this.AJToday;
                var myAjax = new Ajax.Updater('recipient_detail', '/bloodbank/receipient/reqlist', {
                    method: 'get',
                    parameters: pars
                });
                
            }
            else {
                var pars = "date=" + document.getElementById(id).value;
                var myAjax = new Ajax.Updater('recipient_detail', '/bloodbank/receipient/reqlist', {
                    method: 'get',
                    parameters: pars
                });
                
            }
            return true;
            }
            else
            {
            alert('Request Date should be less than or equal to Cross Match Date')
                    var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('recipient_date').value = todaydate
                    return false;
            }
        }
        if (id == 'recipient_component_detail_request_date') {
            $('_recipient_component_detail_request_date_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
                var issue = $('recipient_component_detail_request_date').value
                var time = new Date();
                var year = time.getFullYear();
                var month = time.getMonth();
                var day = time.getDate();
                var issuedate = new Date(issue.split('-')[2], issue.split('-')[1] - 1, issue.split('-')[0])
                var start_date = Date.UTC(year, month, day);
                var a = start_date - (1000 * 60 * 60 * 24 * 7)
                var b = start_date + (1000 * 60 * 60)
                if (issuedate < a) {
                    alert('Select Proper Date')
					var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('recipient_component_detail_request_date').value = todaydate
                    return false;
                }
                else 
                    if (issuedate >= b) {
                        alert('Select Proper Date')
					var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('recipient_component_detail_request_date').value = todaydate
                        return false;
                    }
                    else {
                        return true;
                    }
            }
        }
          if (id == 'dvd_donation_date') {
            $('_dvd_donation_date_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
                var issue = $('dvd_donation_date').value
                var time = new Date();
                var year = time.getFullYear();
                var month = time.getMonth();
                var day = time.getDate();
                var issuedate = new Date(issue.split('-')[2], issue.split('-')[1] - 1, issue.split('-')[0])
                var start_date = Date.UTC(year, month, day);
                var a = start_date - (1000 * 60 * 60 * 24 * 32)
                var b = start_date + (1000 * 60 * 60)
                if (issuedate < a) {
                    alert('Select Proper Date')
					var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('dvd_donation_date').value = todaydate
                    return false;
                }
                else 
                    if (issuedate >= b) {
                        alert('Select Proper Date')
					var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('dvd_donation_date').value = todaydate
                        return false;
                    }
                    else {
                        return true;
                    }
            }
        }
		
		 
		    if (id == 'corporate_validity_date') {
            $('_corporate_validity_date_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
                var cross = $('corporate_validity_date').value
				var date = new Date();
				var new_date = date.getDate()  + '-' + (date.getMonth()+1) + '-' + date.getFullYear();
				
				crossdate = new Date(cross.split('-')[2], cross.split('-')[1] - 1, cross.split('-')[0])
                new_date = new Date(new_date.split('-')[2], new_date.split('-')[1] - 1, new_date.split('-')[0])
				
                if (crossdate < new_date) {
                   alert(' Date should be greater than or equal to Today')
				   $('corporate_validity_date').value = null
                }
				else 
				{
					return true;
				}
                
            }
           
        }
		
		if (id == 'valid_till_date') {
            $('_valid_till_date_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
                var cross = $('valid_till_date').value
				var date = new Date();
				var new_date = date.getDate()  + '-' + (date.getMonth()+1) + '-' + date.getFullYear();
				
				crossdate = new Date(cross.split('-')[2], cross.split('-')[1] - 1, cross.split('-')[0])
                new_date = new Date(new_date.split('-')[2], new_date.split('-')[1] - 1, new_date.split('-')[0])
				
                if (crossdate < new_date) {
                   alert(' Date should be greater than or equal to Today')
				   $('valid_till_date').value = null
                }
				else 
				{
					return true;
				}
                
            }
           
        }
		
		
		 if (id == 'date_of_death') {
            $('_date_of_death_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
                var cross = $('date_of_death').value
				var date = new Date();
				var new_date = date.getDate()  + '-' + (date.getMonth()+1) + '-' + date.getFullYear();
				
				crossdate = new Date(cross.split('-')[2], cross.split('-')[1] - 1, cross.split('-')[0])
                new_date = new Date(new_date.split('-')[2], new_date.split('-')[1] - 1, new_date.split('-')[0])
				
                if (crossdate > new_date) {
                   alert(' Date should not be greater than Today')
				   $('date_of_death').value = null
                }
				else 
				{
					return true;
				}
                
            }
           
        }
		
		if (id == 'required_date') {
            $('_required_date_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
                var cross = $('required_date').value
				var date = new Date();
				var new_date = date.getDate()  + '-' + (date.getMonth()+1) + '-' + date.getFullYear();
				
				crossdate = new Date(cross.split('-')[2], cross.split('-')[1] - 1, cross.split('-')[0])
                new_date = new Date(new_date.split('-')[2], new_date.split('-')[1] - 1, new_date.split('-')[0])
				
                if (crossdate < new_date) {
                   alert(' Date should be greater than or equal to Today')
				   $('required_date').value = null
                }
				else 
				{
					return true;
				}
                
            }
           
        }
                if (id == 'issue_cross_date') {
            $('_issue_cross_date_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
                var cross = $('cross_date').value
                var issue = $('issue_cross_date').value
                crossdate = new Date(cross.split('-')[2], cross.split('-')[1] - 1, cross.split('-')[0])
                issuedate = new Date(issue.split('-')[2], issue.split('-')[1] - 1, issue.split('-')[0])
                if (issuedate >= crossdate) {
                    return true;
                }
                else {
                    alert('Issue Date should be greater than or equal to  Cross Date')
                    var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('issue_cross_date').value = todaydate
                    return false;
                }
            }
            
        }
        if (id == 'issue_match_date') {
            $('_issue_match_date_calendar').style.display = 'none';
            if (document.getElementById(id).value != '') {
                var cross = $('match_date').value
                var issue = $('issue_match_date').value
                crossdate = new Date(cross.split('-')[2], cross.split('-')[1] - 1, cross.split('-')[0])
                issuedate = new Date(issue.split('-')[2], issue.split('-')[1] - 1, issue.split('-')[0])
                if (issuedate >= crossdate) {
                    return true;
                }
                else {
                    alert('Issue Date should be equal or greater than Cross Date')
					    var Month = currentTime.getMonth() + 1;
                    var Day = currentTime.getDate();
                    var Year = currentTime.getFullYear();
                    todaydate = Day + '-' + Month + '-' + Year
                    $('issue_match_date').value = todaydate
                    return false;
                }
            }
            
        }
        if (id == 'cross_date') {
            $('_cross_date_calendar').style.display = 'none';
            document.getElementById("crossmatch_detail_id").value = '';
            if (document.getElementById(id).value == '') {
                var pars = "date=" + this.AJToday;
                var myAjax = new Ajax.Updater('cross_detail', '/bloodbank/receipient/crosslist', {
                    method: 'get',
                    parameters: pars
                });
                $('rescomp').innerHTML = '';
            }
            else {
                document.getElementById("crossmatch_detail_id").value = '';
                var pars = "date=" + document.getElementById(id).value;
                var myAjax = new Ajax.Updater('cross_detail', '/bloodbank/receipient/crosslist', {
                    method: 'get',
                    parameters: pars
                });
                $('rescomp').innerHTML = '';
            }
        }
        if (id == 'match_date') {
            $('_match_date_calendar').style.display = 'none';
            $("crossmatch_detail_id").value = '';
            if (document.getElementById(id).value == '') {
                var pars = "cross_match=" + this.AJToday;
                var myAjax = new Ajax.Updater('cross_detail', '/bloodbank/receipient/crosslist', {
                    method: 'get',
                    parameters: pars
                });
                
            }
            else {
                $("crossmatch_detail_id").value = '';
                var pars = "cross_match=" + document.getElementById(id).value;
                var myAjax = new Ajax.Updater('cross_detail', '/bloodbank/receipient/crosslist', {
                    method: 'get',
                    parameters: pars
                });
                
            }
        }
        		if (id == 'request_date1') {
            $('_request_date1_calendar').style.display = 'none';
            if (document.getElementById(id).value == '') {
                var pars = "date=" + this.AJToday;
                var myAjax = new Ajax.Updater('request_detail', '/lab/ip_lab/requestlist', {
                    method: 'get',
                    parameters: pars
                });
                
            }
            else {
                var pars = "date=" + document.getElementById(id).value;
                var myAjax = new Ajax.Updater('request_detail', '/lab/ip_lab/requestlist', {
                    method: 'get',
                    parameters: pars
                });
                
            }
        }

/*end for Blood bank */
    },

  getMonthName: function(monthNum) { //anomalous
    return this.months[monthNum];
  },

  dateFromAnsiDate: function (ansi_date) {
   return new Date(ansi_date.split('-')[2], Number(ansi_date.split('-')[1]) - 1, ansi_date.split('-')[0])
  },

  ansiDateFromDate: function(date) {
    alert(date.getDate()  + '-' + (date.getMonth()+1) + '-' + date.getFullYear()  );
  },

  getSelectedDate: function (id) {
   if (document.getElementById(id).value == '') return new Date(); // default to today if no value exists
    return this.dateFromAnsiDate(document.getElementById(id).value);
  },

  makeChangeCalendarLink: function (id, label, offset) {
    return ('<a onclick="DatePicker.changeCalendar(\''+id+'\','+offset+')">' + label + '</a>');
  },

  formatDay: function (n) {
    var x;
    switch (String(n)){
      case '1' :
      case '21': case '31': x = 'st'; break;
      case '2' : case '22': x = 'nd'; break;
      case '3' : case '23': x = 'rd'; break;
      default:
        x = 'th';
    }

    return n + x;
  },

  writeMonth: function (id, n) {
    if (this.useDropForMonth) {
      var opts = '';
      for (i in this.months) {
        sel = (i == this.getSelectedDate(id).getMonth() ? 'selected="selected" ' : '');
        opts += '<option ' + sel + 'value="'+ i +'">' + this.getMonthName(i) + '</option>';
      }

      return '<select onchange="DatePicker.selectMonth(\'' + id + '\', this.value)">' + opts + '</select>';
    } else {
      return this.getMonthName(n)
    }
  },

  writeYear: function (id, n) {
    if (this.useDropForYear) {
      var min = this.year - this.yearsPriorInDrop;
      var max = this.year + this.yearsNextInDrop;
      var opts = '';
      for (i = min; i < max; i++) {
        sel = (i == this.getSelectedDate(id).getFullYear() ? 'selected="selected" ' : '');
        opts += '<option ' + sel + 'value="'+ i +'">' + i + '</option>';
      }
      
      return '<select onchange="DatePicker.selectYear(\'' + id + '\', this.value)">' + opts + '</select>';
    } else {
      return n
    }
    
  },

  selectMonth: function (id, n) {
    d = this.getSelectedDate(id)
    d2 = new Date(d.getFullYear(), n, d.getDate())
    d2 = this.unclipDates(d, d2)
    this.setDate(id, d2.getDate() + '-' + (Number(n)+1) + '-' + d2.getFullYear() )
    this.writeCalendar(id)
  },
 

  selectYear: function (id, n) {
    d = this.getSelectedDate(id)
    d2 = new Date(n, d.getMonth(), d.getDate())
    d2 = this.unclipDates(d, d2)
    this.setDate(id, n + '-' + (d2.getMonth()+1) + '-' + d2.getDate() )
    this.writeCalendar(id)
  },

  writeCalendar: function (id) {
    var date = this.getSelectedDate(id);
    var firstWeekday = new Date(date.getFullYear(), date.getMonth(), 1).getDay();
    var lastDateOfMonth = new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate();
    var day  = 1; // current day of month
    currentTime = new Date();
    var hour        = currentTime.getHours();
    var minute      = currentTime.getMinutes();
    var time        = hour+':'+minute;
    // not quite entirely pointless: fix Safari display bug with absolute positioned div
    this.findLinkElement(id).innerHTML = this.findLinkElement(id).innerHTML;
    if(id == 'maincal' || id == 'otmanager' || id == 'dayviewcal' || id=='timecal' || id=='surgerycal' || id=='cssdcal' || id=='requestcal' || id=='surgerycalender')
    {
        var o = '<table cellspacing="1">'; // start output buffer
           o += '<thead><tr>';
    }
    else
    {
        var o = '<table cellspacing="1" id="ForFullBg">';
    }    
    o += '<thead><tr id="ForTopCal">';

    // month buttons
    o +=
      '<th style="text-align:left">' + this.makeChangeCalendarLink(id,'&lt;',-1) + '</th>' +
      '<th colspan="5">' + (this.showDaySuffixInCalendar ? this.formatDay(date.getDate()) : date.getDate()) +
      ' ' + this.writeMonth(id, date.getMonth()) + '</th>' +
      '<th style="text-align:right">' + this.makeChangeCalendarLink(id,'&gt;',1) + '</th>';
    o += '</tr><tr id="ForTopCal">';

    // year buttons
    o +=
      '<th colspan="2" style="text-align:left">' + this.makeChangeCalendarLink(id,'&lt;&lt;',-12) + '</th>' +
      '<th colspan="3">' + this.writeYear(id,  date.getFullYear()) + '</th>' +
      '<th colspan="2" style="text-align:right">' + this.makeChangeCalendarLink(id,'&gt;&gt;',12) + '</th>';
    o += '</tr><tr class="day_labels" id="ForTopCal">';

    // day labels
    for(var i = 0; i < this.days.length; i++) {
      o += '<th>' + this.days[(i+this.firstDayOfWeek) % 7] + '</th>';
    }
    o += '</tr></thead>';
    if (id != 'maincal' && id != 'otmanager' && id != 'dayviewcal' && id!='timecal' && id!='surgerycal' && id!='cssdcal' && id!='requestcal' && id!='surgerycalender')
    {    
        if (this.showCancelLink) {
          o += '<tfoot><tr><td colspan="7"><div class="cancel_butt"><a onclick="DatePicker.cancel(\''+id+'\')">[x] cancel</a></div></td></tr></tfoot>';
        }
    }
     if (this.showTime){
    
     o += '<tfoot><tr><td colspan="7"><div><center>'+time+'</center></div></td></tr></tfoot>';
     }
    // day grid
    //For giving the style -----Change by Selvaraj
    curDate = new Date();
    toDayForstyle = curDate.getUTCDate();
   
    o += '<tbody>';
    for(rows = 1; rows < 7 && (this.constantHeight || day < lastDateOfMonth); rows++) 
    {
              
            o += '<tr>';
            for(var day_num = 0; day_num < this.days.length; day_num++) 
            {
                var translated_day = (this.firstDayOfWeek + day_num) % 7
                if ((translated_day >= firstWeekday || day > 1) && (day <= lastDateOfMonth) ) 
                {
                    //args = [id, (date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + day)];
                    args = [id, (day + '-' + (date.getMonth() + 1) + '-' + date.getFullYear())];
                                       
                   //For converting the date format ------> changed by Selvaraj
                    EveryDay=new Date(date.getFullYear(),date.getMonth(),day);
                    
                    //EveryDay=new Date(day,date.getMonth(),date.getFullYear());
                    //alert(EveryDay);
                    if(EveryDay.getDate() == curDate.getDate())
                    {
                    this.AJToday = args[1];
                    //alert(this.AJToday);
                                        
                    }
                    
                    if(EveryDay.getDay() !=  this.firstDayOfWeek)
                    { 
                       //alert("first");
                        style = (this.selectMonth ? 'style="width: ' + this.largeCellSize + 'px"' : '');
              
                        if (toDayForstyle != day)
                        {
                         o += '<td ' + style + 'background="/images/appointment/calender_bg.png" >' + // link : each day
                         "<a onclick=\"DatePicker.pickDate('" + args.join("','") + "'); return false;\">" + day + '</a>' +
                            '</td>';
                        }
                        else
                        {
                            
                            o +='<td ' + style + 'background="/images/appointment/calender_bg.png"><div class="cal_today">' + // link : each day
                            "<a onclick=\"DatePicker.pickDate('" + args.join("','") + "'); return false;\">" + day + '</a></div>' +
                            '</td>';
                        }
                    }
                    else
                    {
                      //alert("second");
                        style = (this.selectMonth ? 'style="width: ' + this.largeCellSize + 'px"' : '');
              
                        if (toDayForstyle != day)
                        {
                         o += '<td ' + style + 'id="holiday" background="/images/appointment/calender_bg.png">' + // link : each day
                         "<a onclick=\"DatePicker.pickDate('" + args.join("','") + "'); return false;\">" + day + '</a>' +
                            '</td>';
                        }
                        else
                        {  
                            
                            o +='<td ' + style + 'id="holiday" background="/images/appointment/calender_bg.png"><div class="cal_today">' + // link : each day
                            "<a onclick=\"DatePicker.pickDate('" + args.join("','") + "'); return false;\">" + day + '</a></div>' +
                            '</td>';
                        }
                    }  
                    day++;
                } else 
                {
                    o += '<td>&nbsp;</td>';
                }
            }

            o += '</tr></tbody>';
     }

    o += '</table>';
    this.findCalendarElement(id).innerHTML = o;
    if (id == 'date_of_birth') {
		$(id).focus();
	}
  },
  findCalendarElement: function(id) {
  return document.getElementById('_' + id + '_calendar');
  },

  findLinkElement: function(id) {
    return document.getElementById('_' + id + '_link');
  }
  
  
};