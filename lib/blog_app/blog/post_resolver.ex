defmodule BlogApp.Blog.PostResolver do
  alias BlogApp.{Blog.Post, Repo}

  def all(_args, _info) do
    {:ok, Repo.all(Post)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(Post, id) do
      nil -> {:error, "Post id #{id} not found"}
      user -> {:ok, user}
    end
  end

end
