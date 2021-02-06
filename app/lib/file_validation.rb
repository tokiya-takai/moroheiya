class FileValidation

  def self.check(filename)
    unless (filename.end_with?(".png")) || (filename.end_with?(".jpg")) || (filename.end_with?(".jpeg")) || (filename.end_with?(".bmp")) || (filename.end_with?(".pict"))
      return false
    end
    return true
  end
end