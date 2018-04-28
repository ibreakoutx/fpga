xst  -ifn __projnav/hfifo.xst -ofn hfifo.syr
ngdbuild  -dd "f:\fpga\proj\hfifo/_ngo" -nt timestamp -i  -p xc2vp30-ff896-7 hfifo.ngc hfifo.ngd
map  -p xc2vp30-ff896-7 -cm area -pr b -k 4 -c 100 -tx off -o hfifo_map.ncd hfifo.ngd hfifo.pcf
par -w  -ol std -t 1 hfifo_map.ncd hfifo.ncd hfifo.pcf
trce  -e 3 -l 3 -s 7 -xml hfifo hfifo.ncd -o hfifo.twr hfifo.pcf
bitgen  -f hfifo.ut hfifo.ncd
