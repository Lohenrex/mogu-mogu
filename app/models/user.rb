# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :name, uniqueness: true

  has_many :inventory, dependent: :destroy
  has_many :recipes, dependent: :destroy

  enum :role, { admin: 1, premium: 2, free: 3 }
end
