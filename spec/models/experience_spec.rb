require 'rails_helper'

RSpec.describe Experience, type: :model do
  describe 'default experience details' do
    let(:experience) { create :experience }
    let(:second_experience) {
      create :experience,
             rating: Faker::Number.decimal(l_digits: 1, r_digits: 2),
             client_ip: experience.client_ip + '.0'}

    it 'must exist' do
      expect(experience).not_to be_nil
    end

    it 'must be invalid if empty' do
      expect(Experience.new).not_to be_valid
    end

    it 'must be invalid if have dup client_ip' do
      expect(
          Experience.new(
              name: Faker.name,
              client_ip: experience.client_ip,
              rating: Faker::Number.decimal(l_digits: 1, r_digits: 2)
          )).not_to be_valid
    end

    it 'must be calculate amount_rating' do
      amount_rating = ((second_experience.rating + experience.rating) / 2).round(2)
      expect(Experience.amount_rating).to eq(amount_rating)
    end
  end
end
