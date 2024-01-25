

add_executable(main main.cpp)
#set(mraa_DIR ${sysroot}/usr/include/mraa)

#include_directories(${mraa_DIR})
#link_directories(${mraa_DIR})
#PAHO_MQTT_INCLUDE_DIR 


#string(TOLOWER getenv("USER") user_host)

execute_process(
  COMMAND "bash" "-c" "echo $USER"
  OUTPUT_VARIABLE user_host
  OUTPUT_STRIP_TRAILING_WHITESPACE
)


message("---------------------------------" ${user_host})

install(TARGETS main

  DESTINATION /
)

# link sqlite2 e pahomqtt
target_link_libraries(main PRIVATE)
