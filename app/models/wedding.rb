class Wedding < ActiveRecord::Base
  attr_accessible :first_spouse_id, :second_spouse_id

  has_many :inhabitants
  validate :all_wedding_errors

  def self.get_spouse(id)
    wedding = Wedding.find_by_first_spouse_id(id)
    unless wedding.nil?
      return Inhabitant.find_by_id(wedding.second_spouse_id)
    end
    wedding = Wedding.find_by_second_spouse_id(id)
    unless wedding.nil?
      return Inhabitant.find_by_id(wedding.first_spouse_id)
    end
  end

  def self.get_wedding_by_spouse_id(spouse_id)
    wedding = Wedding.find_by_first_spouse_id(spouse_id)
    unless wedding.nil?
      return wedding
    end
    wedding =  Wedding.find_by_second_spouse_id(spouse_id)
    unless wedding.nil?
      return wedding
    end
  end

  private
  def get_married_with_himself
    first_spouse_id == second_spouse_id
  end

  def all_wedding_errors
    if get_married_with_himself then
      errors.add(:second_spouse_id, 'wedding can only be done between two different persons')
    else
      not_adults_first_spouse_error()
      not_adults_second_spouse_error()
      gay_wedding_error()
      first_spouse_already_married()
      second_spouse_already_married()

    end
  end

  def not_adults_first_spouse_error
      if Inhabitant.find_by_id(first_spouse_id).age < 18 then
        errors.add(:first_spouse_id, 'Only adult can get married')
      end
  end

  def not_adults_second_spouse_error
      if Inhabitant.find_by_id(second_spouse_id).age < 18  then
        errors.add(:second_spouse_id, 'Only adult can get married')
      end
  end

  def gay_wedding_error
      if Inhabitant.find_by_id(first_spouse_id).gender == Inhabitant.find_by_id(second_spouse_id).gender then
        errors.add(:second_spouse_id, 'Gay wedding not yet permit')
      end
  end

  def first_spouse_already_married
      unless Wedding.find_by_first_spouse_id(first_spouse_id).nil? and Wedding.find_by_second_spouse_id(first_spouse_id).nil? then
            errors.add(:first_spouse_id, 'already married')
      end
  end

  def second_spouse_already_married
      unless Wedding.find_by_second_spouse_id(second_spouse_id).nil? and Wedding.find_by_first_spouse_id(second_spouse_id).nil? then
        errors.add(:second_spouse_id, 'already married')
      end
  end

end




