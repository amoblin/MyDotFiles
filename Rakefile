# -*- coding: utf-8 -*-
# author: amoblin <amoblin@gmail.com>
# file name: Rakefile
# create date: 2014-10-21
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
  sh "xcodebuild -workspace #{$name}.xcworkspace -scheme #{$name} -configuration Release -sdk macosx10.10 -derivedDataPath . clean"
  sh "xcodebuild -workspace #{$name}.xcworkspace -scheme #{$name} -configuration Release -sdk macosx10.10 -derivedDataPath ."
  File.directory?"/tmp/#{$name}" or `mkdir /tmp/#{$name}`
  sh "rm -rf /tmp/#{$name}/#{$name}.app"
  sh "cp -rf Build/Products/Release/#{$name}.app /tmp/#{$name}/#{$name}.app"
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

