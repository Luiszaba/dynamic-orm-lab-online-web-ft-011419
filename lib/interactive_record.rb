require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  
  
  def self.table_name
    "#{self.to_s.downcase.pluralize}"
  end
  
  def self.column_names
    sql = "pragma table_info('#{table_name}')"
    table_info = DB[:conn].execute(sql)
    column_names = []
    table_info.each {|row| column_names << row["name"]}
    column_names.compact
  end
  
  def initiaize(options={})
    options.each do |property, values|
      self.send('#{property}', values)
    
end
end