require 'rails_helper'

describe 'ユーザー登録機能', type: :system do
  describe '登録' do
    context 'ユーザー登録画面で正しい情報が送信された時' do
      before do
        visit new_user_registration_path
        fill_in '名前', with: 'バリスタ'
        choose '男性'
        select '1997', from: 'user_birthday_1i'
        select '10', from: 'user_birthday_2i'
        select '19', from: 'user_birthday_3i'
        fill_in 'メールアドレス', with: 'barista@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '登録する'
      end

      it '新しくユーザーが登録される' do
        expect(User.count).to eq 1
      end
    end
  end
end