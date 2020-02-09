class School
  def initialize
    @grade_to_names = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(name, grade_num)
    @grade_to_names[grade_num].push(name).sort!
  end

  def to_h
    @grade_to_names.sort.to_h
  end

  def grade(grade_num)
    @grade_to_names.fetch(grade_num, [])
  end
end
