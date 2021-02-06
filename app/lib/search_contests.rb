class SearchContests
  def self.search(search)
    if search != ""
      Contest.where('title like ?',"%#{search}%")
    else
      Contest.all
    end
  end
end