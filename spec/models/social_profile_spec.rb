require 'rails_helper'

describe SocialProfile, type: :model do
  describe '#user_params' do

    before do
      user = create(:user, id: 1)
    end

    context "can save" do

      # 登録可能（全項目あり）
      it "is valid with uid, provider and user_id" do
        sns = build(:social_profile)
        expect(sns).to be_valid
      end
    end

    context "can't save" do

      # 登録不可能（uidなし）
      it "is invalid without uid" do
        sns = build(:social_profile, uid: nil)
        sns.valid?
        expect(sns.errors[:uid]).to include("を入力してください")
      end

      # 登録不可能（providerなし）
      it "is invalid without provider" do
        sns = build(:social_profile, provider: nil)
        sns.valid?
        expect(sns.errors[:provider]).to include("を入力してください")
      end

      # 登録不可能（user_idなし）
      it "is invalid without user_id" do
        sns = build(:social_profile, user_id: nil)
        sns.valid?
        expect(sns.errors[:user_id]).to include("を入力してください")
      end

      # 登録不可能（uidの一意性）
      it "is invalid with not unique uid" do
        sns = create(:social_profile)
        sns2 = build(:social_profile,uid: sns.uid)
        sns2.valid?
        expect(sns2.errors[:uid]).to include("はすでに存在しています")
      end
    end
  end
end