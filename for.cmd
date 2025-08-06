@echo off
setlocal enabledelayedexpansion

:: 初始化退出代码
set "_exitCode=0"
set "dart_files="
set "file_count=0"

:: 检查是否提供了目录参数
if "%~1"=="" (
    echo 错误: 请提供要格式化的目录路径。
    echo 用法: %0 [目录路径]
    set "_exitCode=1"
    goto :Cleanup
)

:: 检查目录是否存在
if not exist "%~1" (
    echo 错误: 指定的目录 "%~1" 不存在。
    set "_exitCode=1"
    goto :Cleanup
)

:: 获取完整路径
set "directory=%~f1"

echo 正在收集目录 "%directory%" 及其子目录中的所有 Dart 文件...

:: 检索所有 Dart 文件并统计数量
for /f %%f in ('dir /s /b "%directory%\*.dart" 2^>nul') do (
    set /a "file_count+=1"
    set "dart_files=!dart_files! "%%f""
)

:: 检查是否找到 Dart 文件
if %file_count% equ 0 (
    echo 未在目录 "%directory%" 及其子目录中找到 Dart 文件。
    goto :Cleanup
)

echo 找到 %file_count% 个 Dart 文件，正在批量格式化...

:: 构造并执行格式化命令
echo 正在执行格式化命令...
dart format %dart_files% || (
    echo 格式化命令执行失败
    set "_exitCode=1"
)

:Cleanup
:: 根据执行结果输出信息
if %_exitCode% equ 0 (
    echo 所有 Dart 文件格式化完成。
) else (
    echo 格式化过程中发生错误，部分文件可能未正确格式化。
)

exit /b %_exitCode%