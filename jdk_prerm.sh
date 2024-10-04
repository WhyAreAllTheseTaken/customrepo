#!/usr/bin/sh

update-alternatives --remove "/usr/bin/java" "java" "/usr/lib/jvm/jdk-21.0.1/bin/java" 0
update-alternatives --remove "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-21.0.1/bin/javac" 0
update-alternatives --remove "/usr/bin/jlink" "jlink" "/usr/lib/jvm/jdk-21.0.1/bin/jlink" 0
update-alternatives --remove "/usr/bin/jshell" "jshell" "/usr/lib/jvm/jdk-21.0.1/bin/jshell" 0
update-alternatives --remove "/usr/bin/javap" "javap" "/usr/lib/jvm/jdk-21.0.1/bin/javap" 0
update-alternatives --remove "/usr/bin/javadoc" "javadoc" "/usr/lib/jvm/jdk-21.0.1/bin/javadoc" 0
update-alternatives --remove "/usr/bin/jar" "jar" "/usr/lib/jvm/jdk-21.0.1/bin/jar" 0
update-alternatives --remove "/usr/bin/jmod" "jmod" "/usr/lib/jvm/jdk-21.0.1/bin/jmod" 0
update-alternatives --remove "/usr/bin/jdeps" "jdeps" "/usr/lib/jvm/jdk-21.0.1/bin/jdeps" 0
update-alternatives --remove "/usr/bin/jdeprscan" "jdeprscan" "/usr/lib/jvm/jdk-21.0.1/bin/jdeprscan" 0
update-alternatives --remove "/usr/bin/jarsigner" "jarsigner" "/usr/lib/jvm/jdk-21.0.1/bin/jarsigner" 0
update-alternatives --remove "/usr/bin/keytool" "keytool" "/usr/lib/jvm/jdk-21.0.1/bin/keytool" 0
update-alternatives --remove "/usr/bin/jconsole" "jconsole" "/usr/lib/jvm/jdk-21.0.1/bin/jconsole" 0
update-alternatives --remove "/usr/bin/jdb" "jdb" "/usr/lib/jvm/jdk-21.0.1/bin/jdb" 0
update-alternatives --remove "/usr/bin/jcmd" "jcmd" "/usr/lib/jvm/jdk-21.0.1/bin/jcmd" 0

