#!/usr/bin/ruby
# = DESCRIPTION
# This files handles connections to the expression database

Ncrna_DB_ADAPTER = 'postgresql'
Ncrna_DB_HOST = 'localhost'
Ncrna_DATABASE = 'ncrna_homolog'
Ncrna_DB_USERNAME = 'tools'
Ncrna_DB_PASSWORD = 'analysis'
Ncrna_DB_Port = 3306

module NcrnaDB
  
  	include ActiveRecord
  
	class DBConnection < ActiveRecord::Base
	  	self.abstract_class = true
  		self.pluralize_table_names = false
    	
    	def self.connect(version="",args={})

      		establish_connection(
                            :adapter => args[:adapter] ||= Ncrna_DB_ADAPTER,
                            :host => args[:host] ||= Ncrna_DB_HOST,
                            :database => args[:database] ||= Ncrna_DATABASE + "_#{version}" ,
                            :username => args[:username] ||= Ncrna_DB_USERNAME,
                            :password => args[:password] ||= Ncrna_DB_PASSWORD,
                            :port => args[:port] ||= Ncrna_DB_Port  
                          )
    	end
  
  	end
  
end
