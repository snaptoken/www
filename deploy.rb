require 'yaml'
require 'net/ftp'

FILES = %w(index.html style.css similarTutorials.html)

ftp_config = YAML.load(File.read("ftp.yml"))
Net::FTP.open(ftp_config[:host], ftp_config[:username], ftp_config[:password]) do |ftp|
  FILES.each do |f|
    if ARGV.empty? or ARGV.any? { |pat| f[pat] }
      puts f
      ftp.putbinaryfile(f, f)
    end
  end
end

