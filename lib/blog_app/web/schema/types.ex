defmodule BlogApp.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: BlogApp.Repo

  object :accounts_user do
    field :id, :id
    field :name, :string
    field :email, :string
    field :posts, list_of(:blog_post), resolve: assoc(:blog_posts)
  end

  object :blog_post do
    field :id, :id
    field :title, :string
    field :body, :string
    field :user, :accounts_user, resolve: assoc(:accounts_users)
  end
end