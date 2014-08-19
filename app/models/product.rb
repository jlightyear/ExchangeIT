class Product < ActiveRecord::Base
	has_attached_file :image,
	:styles => {
  	:thumb    => ['160>',  :jpg, :quality => 50],
  	:preview  => ['x150',  :jpg, :quality => 50],
  	:large    => ['480>',      :jpg, :quality => 60],
  	:retina   => ['1200>',     :jpg, :quality => 30]
	},
	:convert_options => {
  	:thumb    => '-set colorspace sRGB -strip',
  	:preview  => '-set colorspace sRGB -strip',
  	:large    => '-set colorspace sRGB -strip',
  	:retina   => '-set colorspace sRGB -strip -sharpen 0x0.5'
	}
end
