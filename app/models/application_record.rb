require 'uri'
require 'net/http'
require 'digest'
require 'json'
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
