defmodule BlogApp.Schema do
  use Absinthe.Schema
  import_types BlogApp.Schema.Types

  query do
    field :user, type: :accounts_user do
      arg :id, non_null(:id)

      resolve &BlogApp.Accounts.UserResolver.find/2
    end

    field :post, type: :blog_post do
      arg :id, non_null(:id)

      resolve &BlogApp.Blog.PostResolver.find/2
    end

    field :blog_posts, list_of(:blog_post) do
      resolve &BlogApp.Blog.PostResolver.all/2
    end

    field :accounts_users, list_of(:accounts_user) do
      resolve &BlogApp.Accounts.UserResolver.all/2
    end
  end
end
