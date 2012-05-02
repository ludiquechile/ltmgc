#-------------------------------------------------
#
# Project created by QtCreator 2012-04-20T12:23:14
#
#-------------------------------------------------

QT       += core gui opengl

TARGET = LTmgc
TEMPLATE = app

INCLUDEPATH += includes/TUIO
INCLUDEPATH += includes/oscpack
win32:{LIBS += ws2_32.lib \
              winmm.lib \
              -l$$PWD/lib/opencv_core233
       INCLUDEPATH += includes/opencv
       INCLUDEPATH += includes}

unix:{LIBS += -L$$PWD/lib -lopencv_core
      INCLUDEPATH += includes/opencvLinux/opencv
      INCLUDEPATH += includes/opencvLinux}

SOURCES += main.cpp\
        mainwindow.cpp \
    utilidades.cpp \
    tuiomultiplexer.cpp \
    pointcalibration.cpp \
    instructions.cpp \
    glwidget2d.cpp \
    gestureutils.cpp \
    calibrationskt.cpp \
    includes/TUIO/TuioTime.cpp \
    includes/TUIO/TuioServer.cpp \
    includes/TUIO/TuioClient.cpp \
    includes/oscpack/osc/OscTypes.cpp \
    includes/oscpack/osc/OscReceivedElements.cpp \
    includes/oscpack/osc/OscPrintReceivedElements.cpp \
    includes/oscpack/osc/OscOutboundPacketStream.cpp \
    includes/oscpack/ip/IpEndpointName.cpp
win32:SOURCES+=includes/oscpack/ip/win32/UdpSocket.cpp \
    includes/oscpack/ip/win32/NetworkingUtils.cpp
unix:SOURCES+=includes/oscpack/ip/posix/UdpSocket.cpp \
    includes/oscpack/ip/posix/NetworkingUtils.cpp

HEADERS  += mainwindow.h \
    utilidades.h \
    tuiomultiplexer.h \
    pointcalibration.h \
    instructions.h \
    glwidget2d.h \
    gestureutils.h \
    calibrationskt.h \
    includes/TUIO/TuioTime.h \
    includes/TUIO/TuioServer.h \
    includes/TUIO/TuioPoint.h \
    includes/TUIO/TuioObject.h \
    includes/TUIO/TuioListener.h \
    includes/TUIO/TuioCursor.h \
    includes/TUIO/TuioContainer.h \
    includes/TUIO/TuioClient.h \
    includes/oscpack/ip/TimerListener.h \
    includes/oscpack/ip/PacketListener.h \
    includes/oscpack/ip/UdpSocket.h \
    includes/oscpack/ip/NetworkingUtils.h \
    includes/oscpack/ip/IpEndpointName.h \
    includes/oscpack/osc/OscTypes.h \
    includes/oscpack/osc/OscReceivedElements.h \
    includes/oscpack/osc/OscPrintReceivedElements.h \
    includes/oscpack/osc/OscPacketListener.h \
    includes/oscpack/osc/OscOutboundPacketStream.h \
    includes/oscpack/osc/OscHostEndianness.h \
    includes/oscpack/osc/OscException.h \
    includes/oscpack/osc/MessageMappingOscPacketListener.h \


FORMS    += mainwindow.ui \
    tuiomultiplexer.ui \
    pointcalibration.ui \
    instructions.ui

RESOURCES += \
    recursos.qrc

OTHER_FILES += \
    lib/opencv_core233.lib \
    lib/libopencv_core.a \
    License Info/LTmgc-License.txt \
    License Info/LTmgc-License.txt \
    License Info/OpenCV/readme.txt \
    License Info/OpenCV/license.txt \
    License Info/oscpack/license \
    License Info/QT/NQSThirdPartyAgreement.txt \
    License Info/QT/NQSDevAgreement.txt \
    License Info/QT/Notifications_API_terms_and_conditions.txt \
    License Info/QT/LocationTerms.txt \
    License Info/QT/LICENSE.LGPL \
    License Info/QT/LICENSE.GPL3 \
    License Info/QT/LICENSE.FDL \
    License Info/QT/LGPL_EXCEPTION.txt \
    License Info/TUIO/LICENSE.txt \
    License Info/LTmgc-License.txt
