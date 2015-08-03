require 'bundler/setup'
require 'rack/file'
require 'capybara/rspec'

require_relative "examples/filenames"

Capybara.app = Rack::File.new "/Users/chriscaragianis/Code/lfpl"

describe 'Site is up' do
  include Capybara::DSL

  Filenames.all_files.each do |f|
    it "should load #{f}" do 
      visit f
      expect(page.status_code).to eq(200)
    end
    it "#{f} passes visual muster" do
      if (Filenames.html_files.include? f) then
        page.save_screenshot("./spec/screenshots/#{f}.png")
      end
    end
  end
end

describe "Header displays correctly on all pages" do
  include Capybara::DSL
  
  Filenames.html_files.each do |f|

  # LOGO IMAGE
    it "#{f} displays the logo" do
      visit f
      expect(find('.logo-header').visible?).to eq(true)
    end
    it "#{f} displays the correct logo image" do
      visit f
      expect(find('.logo-header')[:src]).to eq('assets/logo_header.png')
    end

  # SEARCH BOX
    it "#{f} displays the search box" do
      visit f
      expect(find('.header .search-box').visible?).to eq(true) 
    end

  # SIGN IN
    it "#{f} displays the sign in dialog" do
      visit f
      expect(find('.header .sign-in').visible?).to eq(true) 
    end

  # DONATE
    it "#{f} displays the donate button" do 
      visit f
      expect(find('.header .donate').visible?).to eq(true) 
    end
  end
end

describe "Related items menu is correctly populated" do
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

 
