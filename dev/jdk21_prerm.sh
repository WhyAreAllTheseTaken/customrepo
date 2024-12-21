#!/usr/bin/bash

update-alternatives --remove "java" "/usr/lib/jvm/jdk-21/bin/java"
update-alternatives --remove "javac" "/usr/lib/jvm/jdk-21/bin/javac"
update-alternatives --remove "jlink" "/usr/lib/jvm/jdk-21/bin/jlink"
update-alternatives --remove "jshell" "/usr/lib/jvm/jdk-21/bin/jshell"
update-alternatives --remove "javap" "/usr/lib/jvm/jdk-21/bin/javap"
update-alternatives --remove "javadoc" "/usr/lib/jvm/jdk-21/bin/javadoc"
update-alternatives --remove "jar" "/usr/lib/jvm/jdk-21/bin/jar"
update-alternatives --remove "jmod" "/usr/lib/jvm/jdk-21/bin/jmod"
update-alternatives --remove "jdeps" "/usr/lib/jvm/jdk-21/bin/jdeps"
update-alternatives --remove "jdeprscan" "/usr/lib/jvm/jdk-21/bin/jdeprscan"
update-alternatives --remove "jarsigner" "/usr/lib/jvm/jdk-21/bin/jarsigner"
update-alternatives --remove "keytool" "/usr/lib/jvm/jdk-21/bin/keytool"
update-alternatives --remove "jconsole" "/usr/lib/jvm/jdk-21/bin/jconsole"
update-alternatives --remove "jdb" "/usr/lib/jvm/jdk-21/bin/jdb"
update-alternatives --remove "jcmd" "/usr/lib/jvm/jdk-21/bin/jcmd"

