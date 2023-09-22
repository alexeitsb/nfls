class User < ApplicationRecord
  ROLE = { 1 => "Administrador", 2 => "Operador" }

  before_create :set_create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :email, email: true, uniqueness: true
  validates :name, length: { minimum: 4, maximum: 20 }

  default_scope { order(:email) }
  scope :administrador, -> { where("role = 1") }
  scope :operador, -> { where("role = 2") }

  def password?
    encrypted_password?
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

  def set_create
    self.name.upcase!
    self.role = 2 if User.any?
    self.reset_password_token = SecureRandom.hex(10) if User.any?
    self.reset_password_sent_at = Time.now if User.any?
  end

end
