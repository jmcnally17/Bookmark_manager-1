require 'pg'
require_relative '../database_connection_setup'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    result = DatabaseConnection.query(sql: 'SELECT * FROM bookmarks')
    result.map do |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end
  end

  def self.create(url:, title:)
    result = DatabaseConnection.query(
      sql: "INSERT INTO bookmarks (url,title) VALUES ($1, $2) RETURNING id, title, url;",
      params: [url, title]
    )
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query(sql: 'DELETE FROM bookmarks WHERE id = $1', params: [id])
  end

  def self.update(id:, title:, url:)
    result = DatabaseConnection.query(
      sql: "UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3 RETURNING id, title, url;",
      params: [url, title, id]
    )
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    result = DatabaseConnection.query(
      sql: "SELECT * FROM bookmarks WHERE id = $1;", params: [id]
    )
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end
end
