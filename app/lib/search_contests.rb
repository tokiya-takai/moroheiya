class SearchContests
  def self.search(search)
    if search != ""
      Contest.where('title like ? OR content like ?',"%#{search}%","%#{search}%")
    else
      Contest.all
    end
  end
end