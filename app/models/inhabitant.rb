class Inhabitant < ActiveRecord::Base
  attr_accessible :age, :first_name, :gender, :last_name
  validates_presence_of :first_name, :last_name, :gender
  validates :gender, :presence => true, :inclusion => {:in => %w(Male Female)}
  validates :age, :presence => true, :numericality => {:only_integer => true, :greater_than => 0}
  validates_uniqueness_of :first_name, :scope => :last_name, :message => 'and Last name already exists for an other inhabitant'
  validate :can_update_age, on: :update

  belongs_to :wedding
  belongs_to :user

  def to_s
    first_name+' '+last_name
  end

  private
  def can_update_age
    unless Wedding.find_by_id(self.id).nil?
       if age < 18
         errors.add(:age, 'Only adult can get married')
       end
    end
  end

end
