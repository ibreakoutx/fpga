setPreference -pref UserLevel:NOVICE
setPreference -pref MessageLevel:DETAILED
setPreference -pref ConcurrentMode:FALSE
setPreference -pref UseHighz:FALSE
setPreference -pref ConfigOnFailure:STOP
setPreference -pref StartupCLock:AUTO_CORRECTION
setPreference -pref AutoSignature:FALSE
setPreference -pref KeepSVF:FALSE
setPreference -pref svfUseTime:FALSE
setPreference -pref UserLevel:NOVICE
setPreference -pref MessageLevel:DETAILED
setPreference -pref ConcurrentMode:FALSE
setPreference -pref UseHighz:FALSE
setPreference -pref ConfigOnFailure:STOP
setPreference -pref StartupCLock:AUTO_CORRECTION
setPreference -pref AutoSignature:FALSE
setPreference -pref KeepSVF:FALSE
setPreference -pref svfUseTime:FALSE
setMode -bs
setPreference -pref UserLevel:Novice
setMode -pff
setMode -mpm
setMode -cf
setMode -dtconfig
setMode -bsfile
setMode -sm
setMode -ss
setMode -bs
addDevice -position 1 -part "xcf32p"
addDevice -position 2 -part "xccace"
addDevice -position 3 -file "F:\fpga\proj\hfifo\hfifo_stim.bit"

setCable -port usb21 -baud 6000000
setMode -bs
setMode -bs
setMode -ss
setMode -sm
setMode -bsfile
setMode -dtconfig
setMode -cf
setMode -mpm
setMode -pff
setMode -bs
Program -p 3 
