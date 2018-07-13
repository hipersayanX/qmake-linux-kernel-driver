CONFIG -= qt

TARGET = mykerneldriver
TEMPLATE = lib

lupdate_only {
    SOURCES += \
        src/mykerneldriver.c
}

KERNEL_RELEASE = $$system(uname -r)

INCLUDEPATH += \
    /usr/lib/modules/$${KERNEL_RELEASE}/build/include \
    /usr/lib/modules/$${KERNEL_RELEASE}/build/include/linux \
    /usr/lib/modules/$${KERNEL_RELEASE}/build/arch/x86/include

DEFINES += \
    __KERNEL__ \
    KBUILD_MODNAME=\"\\\"\\\"\"

OTHER_FILES += \
    src/Makefile

DUMMY_FILES = .
makedriver.input = DUMMY_FILES
makedriver.output = src/$${TARGET}.ko
makedriver.commands = cd src; make; cd ..
makedriver.clean = src/*.ko src/*.o src/*.mod.c src/modules.order src/Module.symvers
makedriver.CONFIG += no_link
QMAKE_EXTRA_COMPILERS += makedriver
PRE_TARGETDEPS += compiler_makedriver_make_all
