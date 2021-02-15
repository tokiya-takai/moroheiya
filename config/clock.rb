require 'clockwork'
include Clockwork

every(1.hour, 'deadline') do
  contests = Contest.all
  contests.each do | contest |
    if is_end?(contest)
      contest.end = true
      contest.save
    end
  end
end

def is_end?(contest)
  now = DateTime.now
  if now >= deadline
    return true
  else
    return false
  end
end