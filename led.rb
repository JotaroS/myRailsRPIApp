require 'pi_piper'

pin = PiPiper::Pin.new(:pin => 4, :direction => :out)

10.times do
  pin.on
  sleep 0.5
  pin.off
  sleep 0.5
end

uexp = open("/sys/class/gpio/unexport", "w")
uexp.write(4)
uexp.close
