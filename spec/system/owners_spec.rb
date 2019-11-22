require 'rails_helper'

describe 'オーナーユーザー登録機能', type: :system do
  describe '登録機能' do
    context 'オーナーユーザー登録画面で正しく情報を入力した時' do
      before do
        visit new_owner_path
        fill_in '店舗名または会社名', with: 'company'
        fill_in '担当者氏名', with: 'owner'
        fill_in '担当者電話番号', with: '11-1111'
        fill_in '担当者メールアドレス', with: 'owner@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '登録する'
      end

      it 'ユーザーが登録される' do
        expect(Owner.count).to eq 1
      end
    end

    context 'オーナーユーザー登録画面で誤った情報を入力した時' do
      before do
        visit new_owner_path
        fill_in '店舗名または会社名', with: 'company'
        fill_in '担当者氏名', with: 'owner'
        fill_in '担当者電話番号', with: '11-1111'
        fill_in '担当者メールアドレス', with: 'owner@example.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'pass'
        click_button '登録する'
      end

      it 'ユーザーの作成に失敗して、エラーメッセージが表示される' do
        expect(Owner.count).to eq 0
        expect(page).to have_content 'パスワード（確認）とパスワードの入力が一致しません'
      end
    end

    context 'オーナーユーザー登録画面で誤った情報を入力した時' do
      before do
        visit new_owner_path
        fill_in '店舗名または会社名', with: 'company'
        fill_in '担当者氏名', with: 'owner'
        fill_in '担当者電話番号', with: '11-1111'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '登録する'
      end

      it 'ユーザーの作成に失敗して、エラーメッセージが表示される' do
        expect(Owner.count).to eq 0
        expect(page).to have_content '担当者メールアドレスを入力してください'
      end
    end
  end

  describe '一覧表示機能' do
    before do
      visit new_owner_path
      fill_in '店舗名または会社名', with: 'company1'
      fill_in '担当者氏名', with: 'owner1'
      fill_in '担当者電話番号', with: '11-1111'
      fill_in '担当者メールアドレス', with: 'owner1@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認）', with: 'password'
      click_button '登録する'

      visit new_owner_path
      fill_in '店舗名または会社名', with: 'company2'
      fill_in '担当者氏名', with: 'owner2'
      fill_in '担当者電話番号', with: '11-1111'
      fill_in '担当者メールアドレス', with: 'owner2@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認）', with: 'password'
      click_button '登録する'
    end

    context '一覧表示画面にアクセスした時' do
      before do
        visit owners_path
      end

      it '一覧表示される' do
        expect(page).to have_content 'company1'
        expect(page).to have_content 'company2'
      end
    end
  end

  describe '詳細表示機能' do
    before do
      visit new_owner_path
      fill_in '店舗名または会社名', with: 'company'
      fill_in '担当者氏名', with: 'owner'
      fill_in '担当者電話番号', with: '11-1111'
      fill_in '担当者メールアドレス', with: 'owner@example.com'
      fill_in 'パスワード', with: 'password'
      fill_in 'パスワード（確認）', with: 'password'
      click_button '登録する'
    end

    context '詳細画面にアクセスした時' do
      before do
        visit owner_path(1)
      end

      it 'ユーザー詳細が表示される' do
        expect(page).to have_content 'company'
        expect(page).to have_content 'タイトルはまだありません'
        expect(page).to have_content 'こんなことやっていますはまだありません'
        expect(page).to have_content '店舗紹介はまだありません'
        expect(page).to have_content 'こんな人探していますはまだありません'
      end
    end
  end
end