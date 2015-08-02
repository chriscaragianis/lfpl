class Filenames 

  @css_files = [
  '/css/main.css',
  '/css/skeleton.css',
  '/css/normalize.css'
  ]

  @html_files = [
  '/index.html'
  ]

  class << self
    def all_files
      out = @css_files << @html_files
      out.flatten
    end

    attr_reader :css_files, :html_files 
  end
end

puts Filenames.all_files
