
def add_bookmark
  bookmark = Bookmark.create(title:'Makers', url: 'http://www.makersacademy.com')
  Bookmark.create(title:'Google', url: 'http://www.google.com')
  Bookmark.create(title:'Destroy', url: 'http://www.destroyallsoftware.com')
end