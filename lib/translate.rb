class Translate
  
  def self.trans(string,language)
    if language == "Tamil"
      string =  I18n.t(string)
    else
    end
      return string
  end
end