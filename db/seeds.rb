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
  birthed_on = Random.rand(start_day..last_day)
  gender = gimei.gender.eql?(:male) ? 1 : 2
  Staff.create!(
    first_name: gimei.first.kanji,
    last_name: gimei.last.kanji,
    birthed_on: birthed_on,
    gender: gender,
    email: "example#{n+1}@example.com", 
    password: "1234rewq", 
    password_confirmation: "1234rewq",
    department_id: Random.rand(1..4)
    
  )
  (Date.today.beginning_of_month..Date.today.end_of_month).each do |worked_on|
    Attendance.create!(
      worked_on: worked_on,
      staff_id: n + 1
    )
  end
end


