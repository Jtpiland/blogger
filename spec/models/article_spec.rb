require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { shoudld validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end
end 
