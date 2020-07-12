class BuildPosts < ApplicationService
  option :posts, Types::PostsRelation
  option :title, Types::Coercible::String, optional: true
  option :user, Types::User, optional: true

  def call
    scope = posts
    scope = posts.where(title: title) if title.present?
    scope = posts.where(user: user) if user.present?
    scope
  end
end
