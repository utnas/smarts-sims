class Divorce < ActiveRecord::Base
  attr_accessible :first_person_id, :second_person_id

  validate :not_married_error, :not_married_with_error

  private
  def self_divorce_error
    first_person_id == second_person_id
  end

  def not_married_error
      if self_divorce_error
        errors.add(:second_person_id, 'Divorce can only be done between two different persons')
      else
        if Wedding.get_spouse(first_person_id).nil? then
              errors.add(:first_person_id, 'not already married, he must be married before divorcing')
        end
        if Wedding.get_spouse(second_person_id).nil? then
          errors.add(:second_person_id, 'not already married, he must be  married before divorcing')
        end
      end
  end

  def not_married_with_error
      unless self_divorce_error
         first_person_spouse = Wedding.get_spouse(first_person_id)
         second_person_spouse = Wedding.get_spouse(second_person_id)
         unless Wedding.get_wedding_by_spouse_id(first_person_id)== Wedding.get_wedding_by_spouse_id(second_person_id)
             unless first_person_spouse.nil?
                errors.add(:first_person_id, 'is not married with the second person')
             end
             unless second_person_spouse.nil?
                errors.add(:second_person_id,'is not married with the first person')
             end
         end
      end
  end
end
