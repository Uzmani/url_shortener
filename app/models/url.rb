class Url < ActiveRecord::Base
   # validates_format_of :long_url,
   #  :with => URI::regexp(%w(http https www))
       validates :long_url, format: { with: /((([A-Za-z]{3,9}:(?:\/\/)?)(?:[-;:&=\+\$,\w]+@)?[A-Za-z0-9.-]+|(?:www.|[-;:&=\+\$,\w]+@)[A-Za-z0-9.-]+)((?:\/[\+~%\/.\w-_]*)?\??(?:[-\+=&;%@.\w_]*)#?(?:[\w]*))?)/ ,
     message: "url invalid!" }
end
