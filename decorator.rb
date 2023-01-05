require_relative 'nameble'

class Decorator < Nameble
  def initialize(nameble)
    super()
    @nameble = nameble
  end

  def correct_name
    @nameble.correct_name
  end
end

class CapitalizeDecorator < Decorator
  def correct_name
    @nameble.correct_name.upcase
  end
end

class TrimmerDecorator < Decorator
  def correct_name
    if @nameble.correct_name.length > 10
      @nameble.correct_name[0, 10]
    else
      @nameble.correct_name
    end
  end
end
