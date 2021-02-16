class AddCups
  def add
    contests = Contest.all
    contests.each do |contest|
      if contest.end == true
        works = Work.where(contest_id: contest.id).order("total_count DESC")
        add_cup(works)
      end
    end
  end

  private
  def add_cup(works)
    if works == []
      return
    end
    i = 0
    rank = 1
    length = works.length - 1
    while rank <= 3 do
      current_work = works[i]
      current_work_total = current_work.total_count
      case rank
      when 1
        firsts = [current_work]
      when 2
        seconds = [current_work]
      when 3
        thirds = [current_work]
      else
      end
      for j in i + 1..length do
        next_work = works[j]
        next_work_total = next_work.total_count
        if current_work_total != next_work_total
          break
        else
          case rank
          when 1
            firsts.push(next_work)
          when 2
            seconds.push(next_work)
          when 3
            thirds.push(next_work)
          else
          end
        end
      end
      i = j
      if i == length
        return
      end
      rank += 1
    end
    firsts.each do |work|
      work.user.count_first += 1
      work.user.save
    end
    unless seconds == nil
      seconds.each do |work|
        work.user.count_second += 1
        work.user.save
      end
    end
    unless thirds == nil
      thirds.each do |work|
        work.user.count_third += 1
        work.user.save
      end
    end
  end
end