module AgeHelper
  def calculate_age(dob)
    now = Time.zone.now
    age = ((now - dob) / 1.year.seconds).floor

    if age > 1
      age.to_s
    else
      "<1"
    end
  end
end

