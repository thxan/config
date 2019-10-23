Invoke-WebRequest -useb get.scoop.sh | Invoke-Expression

scoop install aria2
scoop config aria2-enable true

scoop install git
scoop bucket add java 
scoop bucket add jetbrains 
scoop bucket add extras

scoop install openssh
scoop install openjdk11
scoop install maven
scoop install curl
scoop install Intellij-IDEA-Ultimate