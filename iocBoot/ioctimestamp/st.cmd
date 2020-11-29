#!../../bin/linux-x86_64/timestamp

## You may have to change timestamp to something else
## everywhere it appears in this file

< envPaths

## Register all support components
dbLoadDatabase("../../dbd/timestamp.dbd",0,0)
timestamp_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/timestamp.db","Sys=XF:23ID1-ES,Dev={FCCD-Timestamp},Inp=XF:23ID1-TS{EVR:1}EvtECnt-I")
dbLoadRecords("$(EPICS_BASE)/db/iocAdminSoft.db","IOC=XF:23ID1-ES{FCCD-Timestamp}")

iocInit()

dbl > /cf-update/xf23id1-ioc2.es-timestamp.dbl
