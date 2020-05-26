# -*- encoding: utf-8 -*-

require 'spec_helper'
require 'models/user'

describe User do

  # TODO: auto-generated
  describe '#birth_date_cannot_be_in_the_future' do
    it 'works' do
      user = User.new
      result = user.birth_date_cannot_be_in_the_future
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#password=' do
    it 'works' do
      user = User.new
      p = double('p')
      result = user.password=(p)
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#age' do
    it 'works' do
      user = User.new
      result = user.age
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#check_is_admin' do
    it 'works' do
      user = User.new
      result = user.check_is_admin
      expect(result).not_to be_nil
    end
  end

end
