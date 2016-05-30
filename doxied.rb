require 'doxie'
require 'doxie/scanner'

path = '/home/momo/Dropbox/Scans/'

loop do
  begin
    ips = Doxie::Scanner.ips
    ips.each do |ip|
      client = Doxie::Client.new(ip: ip)
      client.scans.each_with_index do |scan, index|
        scan_name = scan["name"]
        time = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
        client.scan scan_name, "#{path}#{time}_#{index}.jpg"
        puts "Saved #{scan_name} to #{path}#{time}_#{index}.jpg"
        client.delete_scan scan_name
        puts "Deleted #{scan_name}"
      end
    end
  rescue Exception => e  
    puts e
  ensure
    sleep(10)
  end
end
