["経理", "営業", "事務", "総務"].each do |name|
  Department.create(
    name: name
  )
end
50.times do |n|
  gimei  = Gimei.new
  email = "example-#{n+1}@example.com"
  start_day = Date.new(1970, 01, 01)
  last_day = Date.new(1980, 12, 31)
  h_pay = 9999
  l_pay = 0
  hourly_pay = Random.rand(l_pay..h_pay)
  birthed_on = Random.rand(start_day..last_day)
  gender = gimei.gender.eql?(:male) ? 1 : 2
  Staff.create!(
    first_name: gimei.first.kanji,
    last_name: gimei.last.kanji,
    birthed_on: birthed_on,
    hourly_pay: hourly_pay,
    gender: gender,
    email: "example#{n+1}@example.com", 
    password: "1234rewq", 
    password_confirmation: "1234rewq",
    department_id: Random.rand(1..4),
  )
  (Date.today.beginning_of_month..Date.today.end_of_month).each do |worked_on|
    Attendance.create!(
      worked_on: worked_on,
      staff_id: n + 1
    )
  end
end

10.times do |n|
  gimei  = Gimei.new
  email = "manager#{n+1}@example.com"
  Manager.create!(
    first_name: gimei.first.kanji,
    last_name: gimei.last.kanji,
    email: "manager#{n+1}@example.com", 
    password: "1234rewq", 
    password_confirmation: "1234rewq"
  )

end

