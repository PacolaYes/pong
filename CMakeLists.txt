cmake_minimum_required(VERSION 3.15)

project(pong
    VERSION
        1.0
    DESCRIPTION
        "Pong made in C, targetting the Master System & Game Gear"
    LANGUAGES
        C
)

set(EXECUTABLE_FILES src/main.c)

if(SEGA)
    if(MASTERSYSTEM)
        set(SMSLIB_NAME SMSlib)
    else()
        set(SMSLIB_NAME SMSlib_GG)
    endif()

    set(EXECUTABLE_FILES crt0_sms.rel ${EXECUTABLE_FILES} SMSlib/${SMSLIB_NAME}.lib)
endif()

add_executable(pong ${EXECUTABLE_FILES})

if(SEGA)
    if(MASTERSYSTEM)
        set(FILE_TYPE sms)
    else()
        set(FILE_TYPE gg)
    endif()

    add_custom_command(TARGET pong POST_BUILD COMMAND makesms pong.ihx pong.${FILE_TYPE})
endif()
