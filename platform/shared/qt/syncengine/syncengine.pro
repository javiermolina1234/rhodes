QT -= core

TARGET = syncengine
TEMPLATE = lib

CONFIG += staticlib warn_on

INCLUDEPATH += ../..\
../../json

macx {
  DESTDIR = ../../../osx/bin/syncengine
  OBJECTS_DIR = ../../../osx/bin/syncengine/tmp
}

win32 {
  DESTDIR = ../../../win32/bin/syncengine
  OBJECTS_DIR = ../../../win32/bin/syncengine/tmp
  DEFINES += WIN32 _WINDOWS _LIB _UNICODE UNICODE
  debug {
    DEFINES += _DEBUG DEBUG
  }
  release {
    DEFINES += _NDEBUG NDEBUG
  }
}

unix:!macx {
  DESTDIR = ../../../linux/bin/syncengine
  OBJECTS_DIR = ../../../linux/bin/syncengine/tmp
  DEFINES += _GNU_SOURCE
}

DEFINES += RHODES_EMULATOR

!win32 {
  QMAKE_CFLAGS_WARN_ON += -Wno-extra -Wno-unused -Wno-sign-compare -Wno-format -Wno-parentheses
  QMAKE_CXXFLAGS_WARN_ON += -Wno-extra -Wno-unused -Wno-sign-compare -Wno-format -Wno-parentheses
  # QMAKE_CFLAGS += -fvisibility=hidden
  # QMAKE_CXXFLAGS += -fvisibility=hidden
}
win32 {
  QMAKE_CFLAGS_WARN_ON += /wd4996 /wd4100
  QMAKE_CXXFLAGS_WARN_ON += /wd4996 /wd4100
  QMAKE_CFLAGS_RELEASE += /O2
  QMAKE_CXXFLAGS_RELEASE += /O2
}

HEADERS += ../../json/arraylist.h\
../../json/bits.h\
../../json/config.h\
../../json/json_debug.h\
../../json/json.h\
../../json/json_object.h\
../../json/json_object_private.h\
../../json/json_tokener.h\
../../json/json_util.h\
../../json/linkhash.h\
../../json/printbuf.h\
../../sync/RhoconnectClientManager.h\
../../sync/ILoginListener.h\
../../json/JSONIterator.h\
../../db/DBAdapter.h\
../../db/DBAttrManager.h\
../../db/DBImportTransaction.h\
../../db/DBRequestHelper.h\
../../db/DBResult.h

SOURCES += ../../json/arraylist.c\
../../json/json_debug.c\
../../json/json_object.c\
../../json/json_tokener.c\
../../json/json_util.c\
../../json/linkhash.c\
../../json/printbuf.c\
../../json/RJSONTokener.c\
../../sync/RhoconnectClientManager.cpp\
../../json/JSONIterator.cpp\
../../db/DBAdapter.cpp\
../../db/DBAttrManager.cpp\
../../db/DBImportTransaction.cpp\
../../db/DBRequestHelper.cpp\
../../db/DBResult.cpp
