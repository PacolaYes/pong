# also includes the game gear :þ

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1) # does this even make a difference :P
set(CMAKE_SYSTEM_PROCESSOR z80)

set(SEGA TRUE)
if(GAMEGEAR) # u gotta manually define it cuz im lazy
    set(MASTERSYSTEM FALSE) # just to make sure
else()
    set(MASTERSYSTEM TRUE)
endif()

set(CMAKE_C_COMPILER sdcc)

include_directories("SMSlib")
set(CMAKE_C_FLAGS "-mz80 --peep-file SMSlib/peep-rules.txt")
link_libraries("--no-std-crt0 --data-loc 0xC000")
