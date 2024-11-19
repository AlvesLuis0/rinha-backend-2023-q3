# frozen_string_literal: true

class Pessoa < ApplicationRecord
  before_validation :set_id, on: :create

  validates :apelido, :nome, :nascimento, presence: true
  validates :apelido, uniqueness: true
  validates :apelido, length: { maximum: 32 }
  validates :nome, length: { maximum: 100 }
  validate :validate_stack

  scope :search, lambda { |term|
    where('pesquisa ILIKE ?', "%#{term}%")
  }

  private

  STACK_LIMIT_CHARACTERS = 32

  def set_id
    self.id ||= SecureRandom.uuid
  end

  def validate_stack
    return if stack.nil? || stack.empty?

    stack.each do |item|
      if !item.nil? && item.length > 32
        errors.add(:stack, "must be at most #{STACK_LIMIT_CHARACTERS} characters long")
        break
      end
    end
  end
end
