#
# Ruby Dockerfile
#
# https://github.com/dockerfile/python
#

# Pull base image.
FROM ruby:latest

ADD ./sanitizer.rb /sanitizer.rb
ADD ./Gemfile /Gemfile
ADD ./blacklist.yml  /blacklist.yml
ADD ./microservice.yml /microservice.yml

RUN bundle install
