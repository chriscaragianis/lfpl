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
      puts page.current_url 
      expect(page.status_code).to eq(200)
    end
  end
end

describe "Index page has correct content" do
end

describe "Info pages display correct content" do
end

describe "Info page menus unfold correctly" do
end

describe "Info page items display correctly" do
end

describe "Info page top level items redirect to correct info pages" do
end

 
