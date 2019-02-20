require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  self.table_name
  class.to_s.pluralize
end