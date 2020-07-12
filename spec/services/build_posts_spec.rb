require 'rails_helper'

describe BuildPosts, type: :service do
  let(:user) { create(:user, email: 'mail@mail.ma') }
  let(:post_1) { create(:post, user: user, title: 'title_1') }
  let(:post_2) { create(:post, user: user, title: 'title_2') }
  let(:post_3) { create(:post, title: 'title_1') }

  describe '#call' do
    subject(:call_service) { described_class.call(params) }

    let(:params) { { posts: posts, title: post_1.title }}

    context 'when posts is ActiveRecord::AssociationRelation' do
      let(:posts) { user.posts }

      it { is_expected.to eq([post_1]) }
    end

    context 'when posts is ActiveRecord::Relation' do
      let(:posts) { Post.where.not(title: nil) }

      it { is_expected.to eq([post_1, post_3]) }
    end
  end
end
