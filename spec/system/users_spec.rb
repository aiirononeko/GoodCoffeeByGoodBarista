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

    context 'ユーザー登録画面で誤った情報が送信された時（パスワードの不一致）' do
      before do
        visit new_user_registration_path
        fill_in '名前', with: 'バリスタ'
        choose '男性'
        select '1997', from: 'user_birthday_1i'
        select '10', from: 'user_birthday_2i'
        select '19', from: 'user_birthday_3i'
        fill_in 'メールアドレス', with: 'barista@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'pass'
        click_button '登録する'
      end

      it 'ユーザーは登録されず、エラーメッセージが表示される' do
        expect(User.count).to eq 0
        expect(page).to have_content '確認用パスワードとパスワードの入力が一致しません'
      end
    end

    context 'ユーザー登録画面で誤った情報が送信された時（生年月日の未入力）' do
      before do
        visit new_user_registration_path
        fill_in '名前', with: 'バリスタ'
        choose '男性'
        fill_in 'メールアドレス', with: 'barista@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '登録する'
      end

      it 'ユーザーは登録されず、エラーメッセージが表示される' do
        expect(User.count).to eq 0
        expect(page).to have_content '生年月日を入力してください'
      end
    end
  end

  # describe 'プロフィール編集機能' do
  #   before do
  #     visit new_user_registration_path
  #     fill_in '名前', with: 'バリスタ'
  #     choose '男性'
  #     select '1997', from: 'user_birthday_1i'
  #     select '10', from: 'user_birthday_2i'
  #     select '19', from: 'user_birthday_3i'
  #     fill_in 'メールアドレス', with: 'barista@example.com'
  #     fill_in 'パスワード', with: 'password'
  #     fill_in 'パスワード（確認）', with: 'password'
  #     click_button '登録する'

  #     visit new_user_session_path
  #     fill_in 'メールアドレス', with: 'barista@example.com'
  #     fill_in 'パスワード', with: 'password'
  #     click_button 'ログインする'
  #   end

    # context 'プロフィール編集画面でフォームを送信した時' do
    #   before do
    #     visit edit_user_registration_path
    #     fill_in '紹介文', with: '紹介します紹介します紹介します'
    #     fill_in 'やってみたいこと', with: 'こんなことやりたい'
    #     fill_in '職歴', with: '職歴です職歴です職歴です'
    #     fill_in 'スキル', with: 'こんなことできます'
    #     fill_in '学歴', with: '学歴です学歴です学歴です'
    #     fill_in '言語', with: '言語です言語です言語です'
    #     fill_in '資格', with: '資格です資格です資格です'
    #     fill_in '受賞歴', with: '受賞歴です受賞歴です'
    #     click_button 'プロフィールを更新'

    #     visit user_path(user)
    #   end

    #   it 'プロフィールが更新される' do
    #     expect(page).to have_content '紹介します紹介します紹介します'
    #     expect(page).to have_content 'こんなことやりたい'
    #     expect(page).to have_content '職歴です職歴です職歴です'
    #     expect(page).to have_content 'こんなことできます'
    #     expect(page).to have_content '学歴です学歴です学歴です'
    #     expect(page).to have_content '言語です言語です言語です'
    #     expect(page).to have_content '資格です資格です資格です'
    #     expect(page).to have_content '受賞歴です受賞歴です'
    #   end
    # end
  # end
end