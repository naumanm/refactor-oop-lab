class Student

  def initialize params, existing=false
    @id = params["id"]
    @squad_id = params["squad_id"]
    @name = params["name"]
    @age = params["age"]
    @spirit_animal = params["spirit_animal"]
    @existing = existing
  end
  
  # sets a boolean to see if params exist
  def existing?
    @existing
  end

  # this is the db connection
  def self.conn= connection
    @conn = connection
  end

  def self.conn
    @conn
  end

  # returns a list of students
  def self.all
    @conn.exec("SELECT * FROM students")
  end

  # create new student
  # def self.create params
  #   new(params).save
  # end

  def create
      Student.conn.exec('INSERT INTO students (name, age, spirit_animal, squad_id) values ($1,$2,$3,$4)', [ name, age, spirit_animal, squad_id])
  end



  def destroy
    Student.conn.exec('DELETE FROM students WHERE id = ($1)', [ id ] )
  end

end
