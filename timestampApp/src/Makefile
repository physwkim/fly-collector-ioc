TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = timestamp
# timestamp.dbd will be created and installed
DBD += timestamp.dbd

# timestamp.dbd will be made up from these files:
timestamp_DBD += base.dbd
timestamp_DBD += buffer.dbd

# Include dbd files from all support applications:
#timestamp_DBD += xxx.dbd

# Add all the support libraries needed by this IOC
#timestamp_LIBS += xxx

# timestamp_registerRecordDeviceDriver.cpp derives from timestamp.dbd
timestamp_SRCS += timestamp_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
timestamp_SRCS_DEFAULT += timestampMain.cpp
timestamp_SRCS_DEFAULT += buffer.c
timestamp_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#timestamp_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
timestamp_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

