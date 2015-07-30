require 'net/http'

def get_html uri
 u = URI(uri) 
 Net::HTTP.get(u)
end 

def store_htmls uri_list
  uri_list.each do |uri|
    fname = uri.scan(/(?<=.org\/)[\s\S]*\.html*/)
    if fname.length == 0 then
      puts 'BREAK'
      next 
    end
    unless fname[0][0] == '/' 
      fname[0] = '/' << fname[0]
    end
    path_name = '..' << fname[0]
    f = File.new(path_name, "w")
    f.puts get_html uri
  end
end

def get_links html_file
  results = []
  f = File.new(html_file, "r")
  while line = f.gets
    if line.scan(/[^"]+\.html*/)[0]
      link = line.scan(/[^"]+\.html*/)[0]
      unless link.include? 'lfpl.org'
        link = 'http://www.lfpl.org/' << link
      end
      results << link
    end
  end
  return results
end

store_htmls ['http://www.lfpl.org/sitemap.htm']
puts get_links '../sitemap.htm'
store_htmls(get_links('../sitemap.htm'))
