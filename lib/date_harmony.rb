class DateHarmony
  VERSION = '1.0.0'
  
  DATE_TIME_PATTERNS = [
    ['0000-00-00 00:00:00', nil, "MySQL NULL date/time not parseable"],
    [/\A[0-9]{4}\-[0-9]{2}\-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}\Z/, "%Y-%m-%d %H:%M:%S", "MySQL Timestamp 0000-00-00 00:00:00"],
    [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2} [0-9]{1,2}:[0-9]{1,2}[| \t]{0,2}(am|pm|AM|PM)\Z/, "%m/%d/%y %H:%M %p", "Two digit American 3/25/04 1:13 AM"],
    [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4} [0-9]{1,2}:[0-9]{1,2}[| \t]{0,2}(am|pm|AM|PM)\Z/, "%m/%d/%Y %H:%M %p", "Four digit American 3/25/2004 13:06 OR 3/25/2004 13:06"],
    [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2} [0-9]{1,2}:[0-9]{1,2}\Z/, "%m/%d/%y %H:%M", "Two digit American 3/25/04 13:06"],
    [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4} [0-9]{1,2}:[0-9]{1,2}\Z/, "%m/%d/%Y %H:%M", "Four digit American 3/25/2004 13:06"],
    [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}\Z/, "%m/%d/%Y", "US Customary Format with Four Digit Year"],
    [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}\Z/, "%m/%d/%y", "US Customary Format with 2 Digit Year"],
    [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}\Z/, "%m/%d/%Y %H:%M:%S", "US 4 digit year, hours, minutes, and seconds"],
    [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}\Z/, "%m/%d/%y %H:%M:%S", "US 2 digit year, hours, minutes, and seconds"],
    [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4} [0-9]{1,2}:[0-9]{1,2}\Z/, "%m/%d/%Y %H:%M", "US 4 digit year, hours, and minutes"],
    [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2} [0-9]{1,2}:[0-9]{1,2}\Z/, "%m/%d/%y %H:%M", "US 2 digit year, hours, and minutes"],
    [],
    [],
    [],
  ]
  
  DATE_PATTERNS = [
      [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}\Z/, "%m/%d/%Y", "US customary month/day/year with 4 digit year"],
      [/\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}\Z/, "%m/%d/%y", "US customary month/day/year with 2 digit year"],
      [/\A[0-9]{1,2}-[a-zA-Z]{3}-[0-9]{2}\Z/, "%d-%b-%y", "Like 3-Nov-65"],
      [/\A[0-9]{1,2}-[a-zA-Z]{3}-[0-9]{4}\Z/, "%d-%b-%Y", "Like 3-Nov-1965"],
      [/\A[0-9]{1,2}-[a-zA-Z]{3,9}-[0-9]{2}\Z/, "%d-%B-%y", "Like 3-November-65"],
      [/\A[0-9]{1,2}-[a-zA-Z]{3,9}-[0-9]{4}\Z/, "%d-%B-%Y", "Like 3-November-1965"],
      [],
      [],
    ]
  
  
  def parse_aggresively(dv)
    day_info = nil
    begin
      
      #if ('0000-00-00 00:00:00' == dv)
        # MySQL NULL date/time not parseable
      #  day_info = nil
      #elsif (dv =~ /\A[0-9]{4}\-[0-9]{2}\-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}\Z/) != nil
          # MySQL Timestamp 0000-00-00 00:00:00
      #    day_info = DateTime.strptime(dv.to_s.upcase, "%Y-%m-%d %H:%M:%S")
      #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2} [0-9]{1,2}:[0-9]{1,2}[| \t]{0,2}(am|pm|AM|PM)\Z/) != nil 
          # Two digit American 3/25/04 1:13 AM
      #    day_info = DateTime.strptime(dv.to_s.upcase, "%m/%d/%y %H:%M %p")
      #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4} [0-9]{1,2}:[0-9]{1,2}[| \t]{0,2}(am|pm|AM|PM)\Z/) != nil 
          # Four digit American 3/25/2004 13:06 OR 3/25/2004 13:06
      #    day_info = DateTime.strptime(dv.to_s.upcase, "%m/%d/%Y %H:%M %p")
      #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2} [0-9]{1,2}:[0-9]{1,2}\Z/) != nil  
          # Two digit American 3/25/04 13:06
      #    day_info = DateTime.strptime(dv, "%m/%d/%y %H:%M")
      #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4} [0-9]{1,2}:[0-9]{1,2}\Z/) != nil
          # Four digit American 3/25/2004 13:06 
      #    day_info = DateTime.strptime(dv, "%m/%d/%Y %H:%M")
      #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}\Z/) != nil
        # US Customary Format with Four Digit Year
    #    day_info = Date.strptime(dv, "%m/%d/%Y")
      #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}\Z/) != nil
        # US Customary Format with 2 Digit Year
      #  day_info = Date.strptime(dv, "%m/%d/%y")
      #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}\Z/) != nil
        # US Customary Format with Four Digit Year
      #  day_info = DateTime.strptime(dv, "%m/%d/%Y %H:%M:%S")
      #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2} [0-9]{1,2}:[0-9]{1,2}:[0-9]{1,2}\Z/) != nil
        # US Customary Format with 2 Digit Year
      #  day_info = DateTime.strptime(dv, "%m/%d/%y %H:%M:%S")
      #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4} [0-9]{1,2}:[0-9]{1,2}\Z/) != nil
          # US Customary Format with Four Digit Year
      #    day_info = DateTime.strptime(dv, "%m/%d/%Y %H:%M")
      #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2} [0-9]{1,2}:[0-9]{1,2}\Z/) != nil
          # US Customary Format with 2 Digit Year
      #    day_info = DateTime.strptime(dv, "%m/%d/%y %H:%M")
      #else
      #  day_info = DateTime.parse(dv)
      #end
   
    rescue
      day_info = nil
    end # 
  
    return day_info
  end # parse_date_time_aggresively
  
  
  def parse_date(dv)
     begin
      
        #if (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}\Z/) != nil
          # US Customary Format with Four Digit Year
        #  day_info = Date.strptime(dv, "%m/%d/%Y")
        #elsif (dv =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}\Z/) != nil
          # US Customary Format with 2 Digit Year
        #  day_info = Date.strptime(dv, "%m/%d/%y")
        #elsif (dv =~ /\A[0-9]{1,2}-[a-zA-Z]{3}-[0-9]{2}\Z/) != nil
          # 3-Nov-65
        #  day_info = Date.strptime(dv, "%d-%b-%y")
        #elsif (dv =~ /\A[0-9]{1,2}-[a-zA-Z]{3}-[0-9]{4}\Z/) != nil
          # 3-Nov-1965
        #  day_info = Date.strptime(dv, "%d-%b-%Y")
        #elsif (dv =~ /\A[0-9]{1,2}-[a-zA-Z]{3,9}-[0-9]{4}\Z/) != nil
          # 3-November-1965
        #  day_info = Date.strptime(dv, "%d-%B-%Y")
        #elsif (dv =~ /\A[0-9]{1,2}-[a-zA-Z]{3,9}-[0-9]{2}\Z/) != nil
          # 3-November-65
        #  day_info = Date.strptime(dv, "%d-%B-%y")
        #else
        #  day_info = Date.parse(dv)
        #end
        
        match_found = false
        DATE_PATTERNS.each do |pattern_item|
          if (dv =~ pattern_item[0])
            match_found = true
            day_info = Date.strptime(pattern_item[1])
          end
        end
        
        # If no match was found, see if the date object can parse this itself.
        # This will probably fail.
        unless match_found
          day_info = Date.parse(dv)
        end
        
      rescue
        day_info = nil
      end
      
      if nil != day_info
        day_info.strftime("%Y-%m-%d")
      else
        dv
      end
  end # parse_date
  
  ##
  # Static Functions
  
  # Longest months are
  # September, with 9 characters. Tied for second place are February, November and December, with 8 chars each.
  def self.date?(s)
    if (ColumnDataTypeStat.integer?(s) && 8 == s.length)
      # Dates are sometimes stored as integer timestamps
      # like 2s0081203 - so check for years between 1900-01-01 and 2900-12-31 
      si = s.to_i
      is_date = si > 19000101 && si < 29001231 
    elsif (s =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2,4}\Z/) != nil          
      # mm/dd/yyyy
      is_date = true
    elsif (s =~ /^(19|20)\d\d[- \/.](0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])$/) != nil     
      # matches a date in yyyy-mm-dd format from between 1900-01-01 and 2099-12-31, with a choice of four separators
      is_date = true
    elsif (s =~ /\A[0-9]{1,2}[a-zA-Z]{3,9}\/[0-9]{2,4}\\\Z/) != nil     
      # ddMMMyyyy
      is_date = true
    elsif (s =~ /\A[a-zA-Z]{3,9}[ \t][0-9]{1,2}[ \t,]{1,4}[0-9]{2,4}\Z/) != nil     
      # November 22, yyyy
      is_date = true
    else
      is_date = false
    end
    
    # As one final check, try to parse it!
    if is_date
         begin

            if (s =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{4}\Z/) != nil
              # US Customary Format with Four Digit Year
              day_info = Date.strptime(s, "%m/%d/%Y")
            elsif (s =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2}\Z/) != nil
              # US Customary Format with 2 Digit Year
              day_info = Date.strptime(s, "%m/%d/%y")
            else
              day_info = Date.parse(s)
            end
          rescue
            day_info = nil
            is_date = false
          end
    end
  
    is_date
  end # date?
  
  def self.time?(s)
     if (s =~ /^[0-9]{1,2}:[0-9]{1,2}:[0-9]{1,4}$/) != nil          
        # 00:00:0000
        is_valid = true
      elsif (s =~ /\A[0-9]{1,2}:[0-9]{1,2}[ \t]{1,2}[| \t]{0,2}(am|pm|AM|PM)\Z/) != nil     
       # Matches a time with AM or PM
        is_valid = true
      elsif (s =~ /\A[0-9]{1,2}[a-zA-Z]{3,9}\/[0-9]{2,4}\\\Z/) != nil     
        # ddMMMyyyy
        is_valid = true
      else
        is_valid = false
      end
      is_valid
  end
  
  ##
  # Is the text a datetime?
  #
  def self.datetime?(s) 
    
    if (s =~ /\A[0-9]{4}-[0-9]{2}-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}\Z/) != nil
      # MySQL Timestamp 0000-00-00 00:00:00
      is_valid = true 
    elsif (s =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2,4} [0-9]{1,2}:[0-9]{1,2}[| \t]{0,2}(|am|pm|AM|PM)\Z/) != nil 
        # 3/25/04 13:06 OR 3/25/2004 13:06
        is_valid = true
    elsif (s =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2,4} [0-9]{1,2}:[0-9]{1,2}\Z/) != nil  
       # 3/25/04 1:06 PM  OR 3/25/2004 1:06 PM 
       is_valid = true
    elsif (s =~ /\A[0-9]{1,2}\/[0-9]{1,2}\/[0-9]{2,4}\Z/) != nil          
      # mm/dd/yyyy
      is_valid = true
    elsif (s =~ /\A(19|20)\d\d[- \/.](0[1-9]|1[012])[- \/.](0[1-9]|[12][0-9]|3[01])[ \t]{1,3}[0-9]{1,2}:[0-9]{1,2}:[0-9]{0,2}\Z/) != nil     
      # matches a date in yyyy-mm-dd format from between 1900-01-01 and 2099-12-31, with a choice of four separators
      is_valid = true
    elsif (s =~ /\A[0-9]{1,2}-[a-zA-Z]{3,9}-[0-9]{2,4}\Z/) != nil
      # 3-Nov-65
      is_valid = true     
    elsif (s =~ /^[0-9]{1,2}[a-zA-Z]{3,9}\/[0-9]{2,4}\\$/) != nil     
      # ddMMMyyyy
      is_valid = true
    else
      is_valid = false
      #begin
      #  dt = DateTime.parse(s)
      #  is_valid = true unless dt.nil?
      #rescue
      #  is_valid = false
      #end
      
    end
    is_valid
  end # datetime?
  
end
