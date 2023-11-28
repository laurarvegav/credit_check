require 'rspec'
require './lib/credit_card.rb'

describe CreditCard do
    
    it 'has a credit card number' do
    credit_card = CreditCard.new("5541808923795240", 15000)
        expect(credit_card.card_number).to eq ("5541808923795240")
    end

    it 'has a limit' do
    credit_card = CreditCard.new("5541808923795240", 15000)
        expect(credit_card.limit).to eq (15000)
    end

    it 'is valid?' do
        credit_card = CreditCard.new("5541808923795240", 15000)
        expect(credit_card.is_valid?).to eq (true)
        expect(credit_card.is_valid?).to be true
    end

    it 'has last four digits' do
        credit_card =  CreditCard.new("5541808923795240", 15000)
        expect(credit_card.last_four).to eq "5240"
    end

end