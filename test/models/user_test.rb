require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # def setup
  #   @user = User.new(name: 'Example User', email: 'user@example.com',
  #                    password: 'foobar', password_confirmation: 'foobar')
  # end

  # test 'associated microposts should be destroyed' do
  #   @user.save
  #   @user.microposts.create!(content: 'Lorem ipsum')
  #   assert_difference 'Micropost.count', -1 do
  #     @user.destroy
  #   end
  # end
  test 'should follow and unfollow a user' do
    michael = users(:michael)
    archer  = users(:archer)
    assert_not michael.following?(archer)
    michael.follow(archer)
    assert michael.following?(archer)
    michael.unfollow(archer)
    assert_not michael.following?(archer)
    # ユーザーは自分自身をフォローできない
    michael.follow(michael)
    assert_not michael.following?(michael)
  end
end
