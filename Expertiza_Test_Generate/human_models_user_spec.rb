require 'rails_helper'

RSpec.describe User, :type => :model do
    subject {
        described_class.new(
            name: 'testUser', 
            email: 'test@126.com', 
            password: '123456', 
            phone_number: '2102964324',
            date_of_birth: Date.new(2001,1,1), 
            address: "Heaven", 
            is_admin: false)
    }
    describe "Validations" do
        it "is valid with valid attributes" do
            expect(subject).to be_valid
        end
        it "is not valid without a name" do
            subject.name = nil
            expect(subject).to_not be_valid
        end
        it "is not valid without a email" do
            subject.email = nil
            expect(subject).to_not be_valid
        end
        it "is not valid without a password" do
            subject.password = nil
            expect(subject).to_not be_valid
        end
        it "is not valid without a phone_number" do
            subject.phone_number = nil
            expect(subject).to_not be_valid
        end
        it "is not valid without a date_of_birth" do
            subject.date_of_birth = nil
            expect(subject).to_not be_valid
        end
        it "is not valid without a address" do
            subject.address = nil
            expect(subject).to_not be_valid
        end
    end

    describe '#email' do
        it { is_expected.not_to allow_value("blah").for(:email)}
        it { is_expected.to allow_value("a@b.com").for(:email)}
    end

    describe '#phone_number' do
        it { is_expected.not_to allow_value("111","sss","11111111111111111").for(:phone_number)}
        it { is_expected.to allow_value("1111111111").for(:phone_number)}
    end

    it "returns a age of results that match" do
        subject.age > 18
        subject.date_of_birth = Date.new(2011,1,1)
        subject.age < 18
    end
end