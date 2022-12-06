# CMakeList.txt: проект CMake для CMakeProject3; включите исходный код и определения,
# укажите здесь логику для конкретного проекта.
#
cmake_minimum_required (VERSION 3.8)

project(CMakeProject3)				# Название проекта

set(SOURCE_EXE CMakeProject3.cpp)			# Установка переменной со списком исходников

include_directories(foo)			# Расположение заголовочных файлов

add_executable(CMakeProject3 ${SOURCE_EXE})	# Создает исполняемый файл с именем main

add_subdirectory(foo)				# Добавление подпроекта, указывается имя дирректории

target_link_libraries(CMakeProject3 foo)		# Линковка программы с библиотекой

# TODO: Добавьте тесты и целевые объекты, если это необходимо.
