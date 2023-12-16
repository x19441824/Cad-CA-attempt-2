
# test/models/client_test.rb
require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # Test if a valid client can be saved
  test 'should save valid client' do
    client = Client.new(name: 'Test Client', email: 'test@example.com', phone_number: '1234567890', address: '123 Test St', description: 'A test description', price: 100)
    assert client.save, 'Failed to save a valid client'
  end

  # Test to ensure name is required
  test 'should not save client without name' do
    client = Client.new(email: 'test@example.com')
    assert_not client.save, 'Saved the client without a name'
  end

  # Test to ensure email is required
  test 'should not save client without email' do
    client = Client.new(name: 'Test Client')
    assert_not client.save, 'Saved the client without an email'
  end

  # Test to ensure the email is unique
  test 'should not save client with non-unique email' do
    client1 = Client.create(name: 'Test Client', email: 'test@example.com', phone_number: '1234567890', address: '123 Test St', description: 'A test description', price: 100)
    client2 = Client.new(name: 'Another Client', email: 'test@example.com')
    assert_not client2.save, 'Saved the client with a non-unique email'
  end

  # Test to ensure price is a number
  test 'should not save client with non-numeric price' do
    client = Client.new(name: 'Test Client', email: 'test@example.com', price: 'not a number')
    assert_not client.save, 'Saved the client with a non-numeric price'
  end
  

  # Add more tests as needed for other validations and business logic
end

