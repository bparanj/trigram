#!/bin/sh

ruby -Itest -e 'ARGV.each {|f| require f}' ./test/*_test.rb