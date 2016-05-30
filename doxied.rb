require 'doxie'
require 'doxie/scanner'

path = '/home/momo/Dropbox/Scans/'
last_scan = 0

loop do
  begin
    ips = Doxie::Scanner.ips
    ips.each do |ip|
      client = Doxie::Client.new(ip: ip)
      scans = client.scans
      scans.each do |scan|
        this_scan = DateTime.parse(scan["modified"]).strftime("%s").to_i 
        next if this_scan <= last_scan
        scan_name = scan["name"]
        time = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
        client.scan scan_name, "#{path}#{time}.jpg"
        puts "Saved #{scan_name} to #{path}#{time}.jpg"
        last_scan = this_scan
      end
      scan_names = scans.map{|scan| scan["name"] } 
      client.delete_scans scan_names
      puts "Delete scans: #{scan_names}"
    end
  rescue Exception => e  
    puts e
  ensure
    sleep(20)
  end
end
