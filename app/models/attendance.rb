class Attendance < ApplicationRecord

  validates :worked_on, presence: true

  validate :started_mast_before
  validate :not_taking_break
  validate :leaving_work_is_faster
  validate :leaving_break_is_faster

  def self.create_one_month(one_month, staff_id)
    transaction do
      one_month.each do |worked_on|
        create!(
          worked_on: worked_on,
          staff_id: staff_id
        )
      end
    end
  end

  def self.update_one_month(attendances_params)
    attendances = where(id: attendances_params.keys).order(:worked_on).to_a
    attendances.each do |attendance|
      attr = attendances_params[attendance.id.to_s]
      attendance.assign_attributes attr
      attendance.valid?
    end
    return attendances if attendances.any? &:invalid?
    transaction do
      attendances.each do |attendance|
        attendance.save!
      end
    rescue
      false
    end
    true
  end

  def work_min
    return unless started_at && finished_at
    (finished_at - started_at) / 60
  end

  def break_min
    return unless break_started_at && break_finished_at
    (break_finished_at - break_started_at) / 60
  end

  def actual_work_min
    return unless work_min && break_min
    work_min - break_min
  end

  

  private

  def started_mast_before
    return if started_at
    errors.add(:started_at, "を入力して下さい") if break_started_at || break_finished_at || finished_at
  end

  def not_taking_break
    if break_started_at == nil && break_finished_at
      errors.add(:break_started_at, "を入力して下さい")
    end
  end

  def leaving_work_is_faster
    if finished_at && started_at
      if finished_at < started_at
        errors.add(:finished_at, "は出勤時間以前の時刻で入力して下さい。")
      end
    end
  end

  def leaving_break_is_faster
    if break_finished_at && break_started_at
      if break_finished_at < break_started_at
        errors.add(:break_finished_at, "は休憩入以前の時刻で入力して下さい。")
      end
    end
  end

end
