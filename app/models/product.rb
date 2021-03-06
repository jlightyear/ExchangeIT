class Product < ActiveRecord::Base
  belongs_to        :user
  has_many          :comments, dependent: :destroy
  has_attached_file :image,
  :styles => {
    :thumb    => ['75x75',  :jpg, :quality => 50],
    :preview  => ['320x140',  :jpg, :quality => 50],
    :standard    => ['480>',  :jpg, :quality => 60],
    :retina   => ['1200>', :jpg, :quality => 30]
  },
  :convert_options => {
    :thumb    => '-set colorspace sRGB -strip',
    :preview  => '-set colorspace sRGB -strip',
    :standard    => '-set colorspace sRGB -strip',
    :retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
  }

  def self.search(search)
      result = where('name ILIKE ?', "%#{search}%")
      result += where('description ILIKE ?', "%#{search}%")
      user = User.where('email ILIKE ?', "%#{search}%")
      if user.size > 0
        result = user[0].products
      end
      result.uniq
  end

end