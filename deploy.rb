require 'yaml'
require 'net/ftp'

ftp_config = YAML.load(File.read("ftp.yml"))
Net::FTP.open(ftp_config[:host], ftp_config[:username], ftp_config[:password]) do |ftp|
  ftp.putbinaryfile("index.html", "index.html")
end

