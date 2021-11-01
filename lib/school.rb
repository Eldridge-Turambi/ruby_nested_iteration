class School
  attr_reader :name, :groups, :courses

  def initialize(name, groups)
    @name = name
    @groups = groups
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def assign_to_group(student)
    student.group = @groups.sample
  end

  def group_all_students
    students = @courses.map do |course|
      course.students
    end.uniq.flatten

    students.each do |student|
      assign_to_group(student)
    end
  end

  def names
    students = @courses.map do |course|
      course.students
    end.flatten.uniq

    students.map do |student|
      student.name
    end
  end

  def students_by_group
    student_group_hash = {}

    @courses.each do |course|
      course.students.map do |student|
        if student_group_hash[student.group] == nil
          student_group_hash[student.group] = [student]
        elsif !student_group_hash[student.group].include?(student)
          student_group_hash[student.group] << student
        end
      end
    end
    student_group_hash

    ## This below solution works too

    # students = @courses.map do |course|
    #   course.students
    # end.flatten.uniq
    #
    # students.group_by do |student|
    #   student.group
    # end
  end
end
