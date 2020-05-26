require 'rails_helper'

describe User do
  let(:user) do
    User.new
  end

  it '#birth_date_cannot_be_in_the_future' do
    expect(user.birth_date_cannot_be_in_the_future).to eq(nil)
  end

  it '#password=' do
    expect(user.password=('Missing "p"')).to eq('Missing "p"')
  end

  it '#age' do
    expect(user.age).to eq('Exception in RSpec')
  end

  it '#check_is_admin' do
    expect(user.check_is_admin).to eq(nil)
  end
end