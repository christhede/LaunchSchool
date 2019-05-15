# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end
  
  def add(collaborator)
    if collaborator.class != Todo
      raise TypeError.new("Can only add Todo objects")
    else
      @todos << collaborator
    end
  end
  
  def size
    puts @todos.size
  end
  
  def first
    puts @todos.first
  end
  
  def last
    puts @todos.last
  end
  
  def to_a
    @todos.each {|todo| puts todo}
  end
  
  def done?
    puts @todos.all? { |todo| todo.done?}
  end
  
  def item_at(index)
    if @todos[index]
      puts @todos[index]
    else
      raise IndexError.new
    end
  end
  
  def mark_done_at(index)
    if @todos[index]
      @todos[index].done!
    else
      raise IndexError.new
    end
    
    puts @todos[index]
  end
  
  def mark_undone_at(index)
    if @todos[index]
      @todos[index].undone!
    else
      raise IndexError.new
    end
    
    puts @todos[index]
  end
  
  def done!
    @todos.each { |todo| todo.done! }
    @todos.each { |todo| puts todo }
  end
  
  def shift
    puts @todos.shift
  end
  
  def pop
    puts @todos.pop
  end
  
  def remove_at(index)
    if @todos[index]
      @todos.delete_at(index)
    else
      raise IndexError.new
    end
  end
  
  def to_s
    puts "---- Today's Todos ----"
    @todos.each {|todo| puts todo}
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
#list.add(1)                     # raises TypeError with message "Can only add Todo objects"

#list.size
#list.first
#list.last
#list.to_a
#list.done?

#list.item_at(0)
#list.item_at(100)
    
#list.mark_undone_at             # raises ArgumentError
#list.mark_done_at(1)          # marks the 2nd item as not done,
#list.mark_done_at(100)

#list.mark_undone_at(1)
#list.done!
  
#list.to_a
  
#list.remove_at(1)
list.to_a
list.done!
list.to_s