require_relative "../config/environment.rb"
require 'active_support/inflector'

class InteractiveRecord
  
  
  def self.table_name
    "#{self.to_s.downcase.pluralize}"
    
    # create table'_'name -> symbol, dwncase, and pluralize using inflector
  end
  
  def self.column_names
    sql = "pragma table_info('#{table_name}')"
    table_info = DB[:conn].execute(sql)
    column_names = []
    table_info.each {|row| column_names << row["name"]}
    column_names.compact
    
    # create column'_'names via sql command.  Utilize the table in the previous method, and insert row with the title "name"
  end
  
  def initialize(options={})
    options.each do |pr, v|
      self.send("#{pr}=", v)
      
    # initialize the class with an empty hash.  This hash will have a key of properties and its values.  We can then iterate through the k,v with k being the properties so the hash  
  end
end

  def save 
    
    sql = ("INSERT INTO #{table_name_for_insert} #{col_names_for_insert} 
    VALUES  (#{values_for_insert}")
    
    DB[:conn].execute(sql)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM #{table_name_for_insert}")[0][0]
    
    # to save our sql inserts we need to create
  end
  
  










end



