#!../../bin/linux-x86_64/timestamp

## You may have to change timestamp to something else
## everywhere it appears in this file

< envPaths

epicsEnvSet("DEV1", "ENC:")
epicsEnvSet("DEV2", "I0:")
epicsEnvSet("DEV3", "DET1:")
epicsEnvSet("DEV4", "DET2:")
epicsEnvSet("DEV5", "DET3:")
epicsEnvSet("DEV6", "DET4:")
epicsEnvSet("DEV7", "DET5:")
epicsEnvSet("DEV8", "DET6:")
epicsEnvSet("DEV9", "DET7:")

## Register all support components
dbLoadDatabase("../../dbd/timestamp.dbd",0,0)
timestamp_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/switch.db", "Sys=BL9B:HC08E:")
dbLoadRecords("../../db/fanout.db", "Sys=BL9B:HC08E:,Signal=BL9B:HC08:TRIG,Dev1=$(DEV1),Dev2=$(DEV2),Dev3=$(DEV3),Dev4=$(DEV4),Dev5=$(DEV5),Dev6=$(DEV6),Dev7=$(DEV7),Dev8=$(DEV8),Dev9=$(DEV9)")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=$(DEV3),Inp=BL9B:HC08:CH2, Idx=0")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=$(DEV4),Inp=BL9B:HC08:CH3, Idx=1")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=$(DEV5),Inp=BL9B:HC08:CH11, Idx=2")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=$(DEV6),Inp=BL9B:HC08:CH5, Idx=3")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=$(DEV7),Inp=BL9B:HC08:CH6, Idx=4")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=$(DEV8),Inp=BL9B:HC08:CH7, Idx=5")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=$(DEV9),Inp=BL9B:HC08:CH8, Idx=6")
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=$(DEV2),Inp=BL9B:HC08:CH9, Idx=7") # I0
dbLoadRecords("../../db/fly_collect.db","Sys=BL9B:HC08E:,Dev=$(DEV1),Inp=BL9B:HC08:CH13, Idx=8") # Encoder

iocInit()
