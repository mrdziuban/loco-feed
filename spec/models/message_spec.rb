require 'rails_helper'

describe Message do
  let(:message) { Message.new(text: 'test', time_to_live: 1, priority: 1) }

  it 'must have text less than or equal to 140 characters' do
    message.text = 'a' * 141
    expect(message).to_not be_valid
    expect(message.errors[:text].length).to be > 0

    message.text = 'a' * 140
    expect(message).to be_valid
    expect(message.errors[:text].length).to eq 0
  end

  it 'can have a time_to_live of 1 day max' do
    message.time_to_live = 24*60*60 + 1
    expect(message).to_not be_valid
    expect(message.errors[:time_to_live].length).to be > 0

    message.time_to_live = 24*60*60
    expect(message).to be_valid
    expect(message.errors[:time_to_live].length).to eq 0
  end

  it 'must have a priority between 1 and 10' do
    message.priority = 0
    expect(message).to_not be_valid
    expect(message.errors[:priority].length).to be > 0

    message.priority = 11
    expect(message).to_not be_valid
    expect(message.errors[:priority].length).to be > 0

    message.priority = 1
    expect(message).to be_valid
    expect(message.errors[:priority].length).to eq 0
  end
end
