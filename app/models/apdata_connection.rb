class ApdataConnection < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "apdata_#{Rails.env}".to_sym
end