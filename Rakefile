# -*- coding: utf-8 -*-
# author: amoblin <amoblin@gmail.com>
# file name: Rakefile
# create date: <2014-10-21>
# This file is created from $MARBOO_HOME/media/starts/Rakefile
# 本文件由 $MARBOO_HOME/media/starts/Rakefile 复制而来

$name="CloseYourEyes"
$title = "英语魔方秀"
$version = "3.0"

$infoFile = "\`pwd\`/#{$name}/#{$name}-Info"
$infoFile = "\`pwd\`/#{$name}/Info"
$revision = `defaults read #{$infoFile} CFBundleVersion`.rstrip
$version = `defaults read #{$infoFile} CFBundleShortVersionString`.rstrip
task :default do |t|
  puts "info plist version: %s" % $version
  puts "info plist revision: %s" % $revision
  puts "git log revision: %s" % `git log --pretty=oneline|wc -l`
end

task :tag do |t|
  puts `defaults write #{$infoFile} CFBundleShortVersionString #{$version}`
end

task :tr do |t|
  `git diff --cached --name-only | grep .[hm]$ | xargs sed -Ee 's/ +$$//g' -i ""`
  `git diff --cached --name-only | grep .[hm]$ | xargs sed -i .bak "s/^[ ]*$//g"`
  `git add -u`
  `find . -name "*.bak" | xargs rm -f`
end

task :trall do |t|
  `find . -name "*.[hm]" | xargs sed -Ee 's/ +$$//g' -i ""`
  `find . -name "*.[hm]" | xargs sed -i .bak "s/^[ ]*$//g"`
  `find . -name *.bak | xargs rm -f`
end

###################
#  for OS X App
###################

task :xcode do |t|
  sh "xctool -workspace #{$name}.xcworkspace -scheme #{$name} -configuration Release -sdk macosx10.10 -resultBundlePath=Build clean"
  sh "xctool -workspace #{$name}.xcworkspace -scheme #{$name} -configuration Release -sdk macosx10.10 -resultBundlePath=Build build"
  File.directory?"/tmp/#{$name}" or `mkdir /tmp/#{$name}`
  sh "rm -rf /tmp/#{$name}/#{$name}.app"
  sh "cp -rf Build/#{$name}.app /tmp/#{$name}/#{$name}.app"
end

task :dmg => :xcode do |t|
  tag = `git describe --tag`
  filename = "#{$name}_v%s.dmg" % $version
  sh "ln -sf /Applications /tmp/#{$name}"
  sh "rm -rf ~/Downloads/%s" % filename
  sh "hdiutil create ~/Downloads/%s -srcfolder /tmp/#{$name}" % filename
  sh "cp ~/Downloads/%s /tmp" % filename
end

task :install => :xcode do |t|
  sh "sudo rm -rf /Applications/#{$name}.app"
  sh "sudo cp -rf /tmp/#{$name}/#{$name}.app /Applications"
end

########################################################
#
# for iOS App
#
# see    https://github.com/amoblin/simplehttpsserver
#
########################################################





########################
# for static Libraries
########################


task :lib do |t|
  sh "xctool -project UMFeedback.xcodeproj -scheme Feedback -configuration Release -sdk iphonesimulator8.1 build CONFIGURATION_BUILD_DIR=build"
  sh "mv build/libUMFeedback.a build/libUMFeedback_intel.a"
  sh "xctool -project UMFeedback.xcodeproj -scheme Feedback -configuration Release -sdk iphoneos8.1 build CONFIGURATION_BUILD_DIR=Build"
  sh "mv build/libUMFeedback.a build/libUMFeedback_arm.a"

  sh "lipo -create build/libUMFeedback_intel.a build/libUMFeedback_arm.a -output build/libUMFeedback.a"
  sh "lipo -info Build/libUMFeedback.a"
end

task :showSettings do |t|
  xctool -project UMFeedback.xcodeproj -scheme Feedback -showBuildSettings
end

task :libInstall do |t|
cp build/libUMFeedback.a ../FeedbackDemo/UMengFeedback_SDK_2.0
cp UMFeedback/UMFeedback.h ../FeedbackDemo/UMengFeedback_SDK_2.0
cp -r UMFeedback/Base.lproj ../FeedbackDemo/UMengFeedback_SDK_2.0
cp -r UMFeedback/zh-Hans.lproj ../FeedbackDemo/UMengFeedback_SDK_2.0

cp Demo/AppDelegate.h Demo/AppDelegate.m ../FeedbackDemo/FeedbackDemo/
                      cp Demo/ViewController.h Demo/ViewController.m ../FeedbackDemo/FeedbackDemo
end

task :spec do |t|
  sh "pod spec lint UMengFeedback.podspec"
end

task :specUpdate do |t|
  sh "pod trunk push UMengFeedback.podspec"
end
