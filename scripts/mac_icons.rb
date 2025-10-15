require 'open3'

# a = 384
SAFARI_RESOLUTIONS = [48, 64, 96, 128, 256, 512]

CONVERT_CMD = 'magick convert -resize'.freeze
CONVERT_OPTIONS = '-background none -alpha set'.freeze


SAFARI_BASE_PATH = 'safari/no-yt-shorts/'.freeze
SAFARI_EXTENSION_PATH = "#{SAFARI_BASE_PATH}no-yt-shorts\\ Extension/Resources/images/".freeze
SAFARI_SETTINGS_PATH = "#{SAFARI_BASE_PATH}no-yt-shorts/Resources/".freeze


# out_path = '/Users/tools/Dev/opensource/no-yt-shorts/'.freeze

# in_path = 'logo/logo.png'

# resolutions.each do |res|
#   puts "Convertingg to #{res}x#{res} to #{out_path}icon-#{res}.png"
#   Open3.capture3("#{CONVERT_CMD} #{res}x#{res}! #{in_path} #{CONVERT_OPTIONS} #{out_path}icon-#{res}.png")
# end

png_path = 'logo/logo.png'
safari_toolbar_svg_path = "logo/logo_safari_toolbar.svg"

def safari_extension_conversion(png_path, toolbar_svg_path)
  out_path = "#{SAFARI_SETTINGS_PATH}Icon.png"
  cmd = "#{CONVERT_CMD} 384x384! #{png_path} #{CONVERT_OPTIONS} #{out_path}"

  puts "Creating Safari Settings Icon using command:\n\t#{cmd}"
  Open3.capture3(cmd)

  puts "Creating logos for Safari Extension from #{png_path}"
  SAFARI_RESOLUTIONS.each do |res|
    out_file_name = "icon-#{res}.png"
    out_path = "#{SAFARI_EXTENSION_PATH}#{out_file_name}"
    cmd = "#{CONVERT_CMD} #{res}x#{res}! #{png_path} #{CONVERT_OPTIONS} #{out_path}"
    puts "Converting #{png_path} to #{out_path} using command:\n\t#{cmd}"
    Open3.capture3(cmd)
  end

  cmd = "cp #{toolbar_svg_path} #{SAFARI_EXTENSION_PATH}toolbar-icon.svg"
  puts "Copying Toolbar icon with command:\n\t#{cmd}"
  Open3.capture3(cmd)
end

safari_extension_conversion(png_path, safari_toolbar_svg_path)
