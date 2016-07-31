require 'pry'

class Owner

  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(name)
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.reset_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def species
    @species = "human"
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    self.pets[:fishes] << new_fish
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    self.pets[:cats] << new_cat
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    self.pets[:dogs] << new_dog
  end

  def walk_dogs
    self.pets[:dogs].each { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    self.pets[:cats].each { |cat| cat.mood = "happy" }
  end

  def feed_fish
    self.pets[:fishes].each { |fishes| fishes.mood = "happy" }
  end

  def sell_pets

    self.pets.each do |species, array_pets|
      array_pets.each do |pet|
        pet.mood = "nervous"
      end
    end

    self.pets.map do |species, array_pets|
      array_pets.clear
    end

  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

end
