#!/usr/bin/env ruby
#
# Usage: push.rb JSON_MESSAGE
#
# ex) ruby push.rb '{"aps":{"sound":"chime","badge":128,"alert":"This is test message from ruby"}}' DEVICETOKEN PEMFILE
#
# This code supports Ruby 1.8.x only.
#

require 'socket'
require 'openssl'


key = [ARGV[1].delete(' ')].pack('H*')
message = ARGV.shift
notification_packet = [0, 0, 32, key, 0, message.size, message].pack("ccca*cca*")

context = OpenSSL::SSL::SSLContext.new
context.cert = OpenSSL::X509::Certificate.new(File.read(ARGV[1]))
context.key = OpenSSL::PKey::RSA.new(File.read(ARGV[1]))

sock = TCPSocket.new('gateway.sandbox.push.apple.com', 2195)
#sock = TCPSocket.new('gateway.push.apple.com', 2195)
ssl = OpenSSL::SSL::SSLSocket.new(sock,context)
ssl.connect
ssl.write(notification_packet)
ssl.close
sock.close