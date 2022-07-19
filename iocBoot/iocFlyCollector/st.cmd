#!../../bin/linux-x86_64/timestamp

## You may have to change timestamp to something else
## everywhere it appears in this file

< envPaths

## Register all support components
dbLoadDatabase("../../dbd/timestamp.dbd",0,0)
timestamp_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/switch.db", "Sys=BL9B:HC08E:")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=DET1:,Inp=BL9B:HC08:CH2, Idx=0")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=DET2:,Inp=BL9B:HC08:CH3, Idx=1")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=DET3:,Inp=BL9B:HC08:CH11, Idx=2")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=DET4:,Inp=BL9B:HC08:CH5, Idx=3")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=DET5:,Inp=BL9B:HC08:CH6, Idx=4")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=DET6:,Inp=BL9B:HC08:CH7, Idx=5")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=DET7:,Inp=BL9B:HC08:CH8, Idx=6")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=I0:,Inp=BL9B:HC08:CH9, Idx=7") # I0
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=ENC:,Inp=BL9B:HC08:CH13, Idx=8") # Encoder

iocInit()
