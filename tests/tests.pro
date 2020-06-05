QT = core testlib

TARGET = pantry_model_test
CONFIG += qt warn_on depend_includepath testcase

TEMPLATE = app

CONFIG += sanitizer sanitize_address
QMAKE_CXXFLAGS+="-fsanitize=address -fno-omit-frame-pointer"
QMAKE_CFLAGS+="-fsanitize=address -fno-omit-frame-pointer"
QMAKE_LFLAGS+="-fsanitize=address"

INCDIR = ../src
INCLUDEPATH += $$INCDIR
HEADERS += $$INCDIR/food_item.h $$INCDIR/pantry_model.h
SOURCES += $$INCDIR/food_item.cpp $$INCDIR/pantry_model.cpp

SOURCES += pantry_model_test.cpp
