require_relative './nameable'

class Person < Nameable
  attr_accessor :name, :age

  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = rand(1..10_000)

    @name = name

    @age = age

    @parent_permission = parent_permission

    @rentals = []
    super()
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  private

  def of_age?
    @age >= 18
  end
end
