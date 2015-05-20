class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :picture, styles: {micro: '50x50',
                                       thumb: '100x100',
                                       small: '200x200',
                                       medium: '300x300'
                                     }, default_url: "Hipster_with_glasses.jpg"

  validates_attachment_content_type :picture, content_type: ["image/jpg", "image/jpeg", "image/png"]


  has_many :applications, dependent: :destroy
  validates :name, length: { in: 2..32 }
  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true,
            format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :location, presence: true
  validates :slug, uniqueness: true

  before_validation :generate_slug

  enum role: %w(applicant business admin)

  def self.find_or_create_by_auth(auth_data)
    user = User.find_or_create_by(id: auth_data['uid'][1..3])
    if user.name != auth_data["info"]["name"]
      user.name     = auth_data["info"]["name"]
      user.username = auth_data["info"]["nickname"]
      user.email    = "temp_email#{auth_data['uid']}@example.com"
      user.password = "temporarypassword"
      user.save
    end
    user
  end

  def generate_slug
    self.slug = username.parameterize
  end

  scope :business, -> { where(role: "business")}
end
