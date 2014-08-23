class Product < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'user_id'
	has_attached_file :image,
	:styles => {
  	:thumb    => ['160>',  :jpg, :quality => 50],
  	:preview  => ['320x150',  :jpg, :quality => 50],
  	:large    => ['480>',  :jpg, :quality => 60],
  	:retina   => ['1200>', :jpg, :quality => 30]
	},
	:convert_options => {
  	:thumb    => '-set colorspace sRGB -strip',
  	:preview  => '-set colorspace sRGB -strip',
  	:large    => '-set colorspace sRGB -strip',
  	:retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
	}

  def self.search(search)
      result = where('name ILIKE ?', "%#{search}%")
      result += where('description ILIKE ?', "%#{search}%")
      result.uniq
  end

  def self.search_product_by_email(search)
    user = User.where('email ILIKE ?', "%#{search}%")
    result = user.products
  end

end