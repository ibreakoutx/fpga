#ChipScope Core Inserter Project File Version 3.0
#Mon May 30 23:25:36 CDT 2005
Project.device.designInputFile=f\:\\fpga\\proj\\llist_fifo\\stimulus_cs.ngc
Project.device.designOutputFile=f\:\\fpga\\proj\\llist_fifo\\stimulus_cs.ngc
Project.device.deviceFamily=3
Project.device.enableRPMs=true
Project.device.outputDirectory=f\:\\fpga\\proj\\llist_fifo\\_ngo
Project.device.useSRL16=true
Project.filter.dimension=7
Project.filter<0>=
Project.filter<1>=*ack*
Project.filter<2>=dealloc*
Project.filter<3>=*req*
Project.filter<4>=dut/alloc*
Project.filter<5>=*alloc_id*
Project.filter<6>=*alloc*
Project.icon.boundaryScanChain=0
Project.icon.disableBUFGInsertion=false
Project.icon.enableExtTriggerIn=false
Project.icon.enableExtTriggerOut=false
Project.icon.triggerInPinName=
Project.icon.triggerOutPinName=
Project.unit.dimension=1
Project.unit<0>.clockChannel=SYSTEM_CLOCK_BUFGP
Project.unit<0>.clockEdge=Rising
Project.unit<0>.dataChannel<0>=alloc_req
Project.unit<0>.dataChannel<10>=dealloc_req
Project.unit<0>.dataChannel<11>=dut/dealloc_ack
Project.unit<0>.dataChannel<12>=dealloc_id<0>
Project.unit<0>.dataChannel<13>=dealloc_id<1>
Project.unit<0>.dataChannel<14>=dealloc_id<2>
Project.unit<0>.dataChannel<15>=dealloc_id<3>
Project.unit<0>.dataChannel<16>=dealloc_id<4>
Project.unit<0>.dataChannel<17>=dealloc_id<5>
Project.unit<0>.dataChannel<18>=dealloc_id<6>
Project.unit<0>.dataChannel<19>=dealloc_id<7>
Project.unit<0>.dataChannel<1>=dut/alloc_ack
Project.unit<0>.dataChannel<20>=wait_for_alloc_ack
Project.unit<0>.dataChannel<21>=wait_for_dealloc_ack
Project.unit<0>.dataChannel<2>=dut/alloc_id<0>
Project.unit<0>.dataChannel<3>=dut/alloc_id<1>
Project.unit<0>.dataChannel<4>=dut/alloc_id<2>
Project.unit<0>.dataChannel<5>=dut/alloc_id<3>
Project.unit<0>.dataChannel<6>=dut/alloc_id<4>
Project.unit<0>.dataChannel<7>=dut/alloc_id<5>
Project.unit<0>.dataChannel<8>=dut/alloc_id<6>
Project.unit<0>.dataChannel<9>=dut/alloc_id<7>
Project.unit<0>.dataDepth=16384
Project.unit<0>.dataEqualsTrigger=false
Project.unit<0>.dataPortWidth=22
Project.unit<0>.enableGaps=false
Project.unit<0>.enableStorageQualification=false
Project.unit<0>.enableTimestamps=false
Project.unit<0>.timestampDepth=0
Project.unit<0>.timestampWidth=0
Project.unit<0>.triggerChannel<0><0>=alloc_req
Project.unit<0>.triggerConditionCountWidth=0
Project.unit<0>.triggerMatchCount<0>=1
Project.unit<0>.triggerMatchCountWidth<0><0>=0
Project.unit<0>.triggerMatchType<0><0>=0
Project.unit<0>.triggerPortCount=1
Project.unit<0>.triggerPortIsData<0>=true
Project.unit<0>.triggerPortWidth<0>=1
Project.unit<0>.triggerSequencerLevels=16
Project.unit<0>.triggerSequencerType=0
Project.unit<0>.type=ilapro
