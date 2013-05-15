class Job < ActiveRecord::Base
  attr_accessible :end_date, :is_avaliable, :position, :rate, :start_date, :location, :region, :user_id

  belongs_to :user


  def is_avaliable
    :is_avaliable ? 'Yes' : 'No'
  end

end
