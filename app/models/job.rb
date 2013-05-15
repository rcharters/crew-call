class Job < ActiveRecord::Base
  attr_accessible :end_date, :is_avaliable, :position, :rate, :start_date

  belongs_to :user
end
