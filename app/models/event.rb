class Event < ActiveRecord::Base

  #-------------
  # Validations
  #-------------
  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
  validates :event_type, presence: true
  validates :description, presence: true
  validate :start_time_cannot_be_in_the_past, 
           :end_time_cannot_be_in_the_past,
           :end_time_cannot_be_before_start_time

  #-------------------
  # Validation Methods
  #-------------------

  def start_time_cannot_be_in_the_past
    if start_datetime.present? && start_datetime < Time.now
      errors.add(:start_datetime, "can't be in the past")
    end
  end

  # Needs refactoring since practically the same as above
  def end_time_cannot_be_in_the_past
    if end_datetime.present? && end_datetime < Time.now
      errors.add(:end_datetime, "can't be in the past")
    end
  end

  def end_time_cannot_be_before_start_time
    if start_datetime.present? && end_datetime.present? && end_datetime <= start_datetime
      errors.add(:end_datetime, "can't be before the start time")
    end
  end

end
