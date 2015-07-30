require_relative '../../lfpl.rb'
require_relative '../spec_helper.rb' 

describe 'says hello' do
  it 'orter damn say hello' do
    visit '/hi'
  expect(page).to have_content("Hello")
  end
end
    

