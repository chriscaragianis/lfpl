class Filenames 

  @css_files = [
    '/css/main.css',
    '/css/skeleton.css',
    '/css/normalize.css'
  ]

  @html_files = [
    '/borrowing.html'
  ]

  @media_files = [
    '/assets/logo_header.png'
  ]

  class << self
    def all_files
      out = @css_files << @html_files << @media_files
      out.flatten
    end

    attr_reader :css_files, :html_files, :media_files
  end
end

