require 'clockwork'
include Clockwork

require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)

every(1.hour, 'deadline1', at: '**:00') do
  deadline
end

every(1.day, 'deadline2', at: '23:59') do
  deadline
end

def deadline
  contests = Contest.all
  contests.each do | contest |
    if is_end?(contest)
      contest.end = true
      contest.save
      file = File.open('clockwork_log.txt', 'a')
      log = DateTime.now
      file.puts log
    end
  end
end

def is_end?(contest)
  now = DateTime.now
  if now >= contest.deadline
    return true
  else
    return false
  end
end