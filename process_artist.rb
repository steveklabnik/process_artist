require 'ruby-processing'

# This is my first ruby-processing project! Neat!

class ProcessArtist < Processing::App

  def setup
    background(0, 0, 0)
    @size = 10
    @queue = ""
  end

  def draw
    # Do Stuff
  end

  def key_pressed
    warn "A key was pressed! #{key.inspect}"

    if !key.is_a?(String)
      warn "That wasn't a string!"
      return
    end

    if key == "+"
      @size += 100
    elsif key == "-"
      @size -= 100
    elsif key != "\n"
      @queue = @queue + key
    else
      warn "Time to run the command: #{@queue}"
      @shape = @queue.chomp
      @queue = ""
    end
  end

  def mouse_dragged
    fill(123,123,123)

    case @shape
    when "rectangle" then rect(mouse_x, mouse_y, @size, @size)
    when "bigrectangle" then rect(mouse_x, mouse_y, @size * 2, @size * 2)
    when "oval" then oval(mouse_x, mouse_y, @size, @size)
    else
      rect(mouse_x, mouse_y, 5, 5)
    end
      
  end


end

ProcessArtist.new(:width => 800, :height => 800,
                  :title => "ProcessArtist", :full_screen => false)














