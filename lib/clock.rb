require 'clockwork'
include Clockwork

require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)

every(1.hour, 'deadline', at: '**:00') do
  contests = Contest.all
  contests.each do | contest |
    if is_end?(contest)
      contest.end = true
      contest.save
      file = File.open('clockwork_log.txt', 'a')
      file.puts(DateTime.now)
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