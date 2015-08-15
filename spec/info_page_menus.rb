require 'bundler/setup'
require 'rack/file'
require 'capybara/rspec'

require_relative "examples/filenames"

Capybara.app = Rack::File.new "/Users/chriscaragianis/Code/lfpl"

describe "Related items menu is correctly populated" do
  include Capybara::DSL
  
  Filenames.html_files.each do |f|
    it "#{f} appears in the related list" do
      visit f
      all('.related-link').each do |e|
        puts e[:href]
      end
        end
      end
  end 
    
    
describe "Recent items menu is correctly populated" do
end

describe "Info pages display correct content" do
end

describe "Info page menus unfold correctly" do
end

describe "Info page items display correctly" do
end

describe "Info page top level items redirect to correct info pages" do
end
