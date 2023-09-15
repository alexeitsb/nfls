class User < ApplicationRecord
  before_create :set_defaults

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :email, email: true, uniqueness: true
  validates :name, length: { minimum: 4, maximum: 20 }

  ROLE = { 1 => "Administrador", 2 => "Operador" }

  def password_reuired?
    false
  end

  def administrador?
    role == 1
  end

  def operador?
    role == 2
  end

  def role_description
    if administrador?
      "ADMINISTRADOR"
    elsif operador?
      "OPERADOR"
    end
  end

  private

  def set_defaults
    self.role = 2
  end

end
