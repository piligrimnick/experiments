module Types
  include Dry::Types.module

  User = Instance(User)
  Post = Instance(Post)

  # Нет проверки на причастность к классу Post
  PostsRelation = Instance(ActiveRecord::Relation) | Instance(ActiveRecord::AssociationRelation)
end
