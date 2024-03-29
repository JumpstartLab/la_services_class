require 'spec_helper'

describe Mailer do
  before(:each) do
    ActionMailer::Base.delivery_method = :smtp
  end

  it 'sends a welcome email' do
    user = FactoryGirl.create(:user)
    data = {"email" => "sample@example.com", "name" => "John Doe"}
    Mailer.welcome_email(data).deliver
  end

  it 'sends an order confirmation email' do
    user = FactoryGirl.create(:user)
    order = FactoryGirl.create(:order, user: user)
    data = {
      "name" => "Alice Smith",
      "email" => "alice@example.com",
      "items" => [
        {
          "title" => "Li Hing Mui Lollypops",
          "quantity" => 3
        }
      ],
      "total" => 12.00
    }
    Mailer.order_confirmation(data).deliver
  end
end
