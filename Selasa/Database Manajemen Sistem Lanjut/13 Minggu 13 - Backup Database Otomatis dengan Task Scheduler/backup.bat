@echo off
title Backup database
echo Backup database. Tugas Mata kuliah Database Manajemen Sistem Lanjut
echo Isep Lutpi Nur 2113191079

mysqldump -u iseplutpi -p1008 --databases php_dasar C:\database_backup.sql

