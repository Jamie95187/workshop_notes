class NoteBook
  attr_acecssor :folder
  def initialize
    @folder = []
  end

  private

  def search(tag)
    @folder.map { |textnote| if textnote.tag == tag}
  end

end

class TextNote
  attr_reader :tag
  def initialize(text)
    @text = text
    @tag = ""
  end
  def store(notebook)
    notebook.folder << self
  end
  def add_tag(tag_name)
   @tag = Tag.new(tag_name)
  end
end

class Tag
  attr_reader :topic
  def initialize(topic)
    @topic = topic
  end
end
