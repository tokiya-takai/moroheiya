require 'clockwork'
include Clockwork

require File.expand_path('../../config/boot', __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require File.expand_path('../add_cups', __FILE__)

every(1.hour, 'deadline1', at: '**:30') do
  deadline
  add_cup = AddCups.new
  add_cup.add
end

every(1.day, 'deadline2', at: '23:59') do
  deadline
  add_cup = AddCups.new
end

private

def deadline
  contests = Contest.all
  contests.each do | contest |
    if is_end?(contest)
      contest.end = true
      contest.save(validate: false)
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