require 'test_helper'

class Admin::AlertTest < ActiveSupport::TestCase
  test 'should not create alert if description is shorter than 100 char\'s' do
    alert = Admin::Alert.new(description: 'test ',
                             category: Admin::Alert.categories[:breakdown],
                             email: 'example@test.com')
    assert_not alert.save
  end

  test 'should not create alert if category is not present' do
    alert = Admin::Alert.new(description: 'test ',
                             email: 'example@test.com')
    assert_not alert.save
  end

  test 'should not create alert if email is not present' do
    alert = Admin::Alert.new(description: 'test ',
                             category: Admin::Alert.categories[:breakdown],
                             email: '')
    assert_not alert.save
  end

  test 'should not create alert if email is invalid' do
    alert = Admin::Alert.new(description: 'test ',
                             category: Admin::Alert.categories[:breakdown],
                             email: 'test@')
    assert_not alert.save
  end

  test 'Breakdown alert should containt rush hours price' do
    alert = Admin::Alert.new(description: 'test ' * 20,
                             category: Admin::Alert.categories[:breakdown],
                             email: 'example@test.com')

    travel_to Time.new(2004, 11, 24, 10, 00, 00) do
      alert.save!
    end

    assert_equal 50.0, alert.price

    expected = alert.created_at + 4.hours
    assert_equal expected.to_s, alert.deadline.to_s
  end

  test 'Breakdown alert shouldn\'t containt rush hours price' do
    alert = Admin::Alert.new(description: 'test ' * 20,
                             category: Admin::Alert.categories[:breakdown],
                             email: 'example@test.com')

    travel_to Time.new(2004, 11, 24, 20, 04, 44) do
      alert.save!
    end

    assert_equal 100.0, alert.price

    expected = alert.created_at + 4.hours
    assert_equal expected.to_s, alert.deadline.to_s
  end

  test 'Damage alert should have one day for repair' do
    alert = Admin::Alert.create!(description: 'test ' * 20,
                                 category: Admin::Alert.categories[:damage],
                                 email: 'example@test.com')

    assert_equal 10.0, alert.price

    expected = alert.created_at + 1.day
    assert_equal expected.to_s, alert.deadline.to_s
  end

  test 'Fault alert should have 3 days for repair' do
    alert = Admin::Alert.create!(description: 'test ' * 20,
                                 category: Admin::Alert.categories[:fault],
                                 email: 'example@test.com')

    assert_equal 1.0, alert.price

    expected = alert.created_at + 3.day
    assert_equal expected.to_s, alert.deadline.to_s
  end
end
