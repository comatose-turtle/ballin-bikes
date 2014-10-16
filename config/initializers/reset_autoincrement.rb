ActiveRecord::Base.class_eval do
  def self.reset_autoincrement(to=1)
    case self.connection.adapter_name
      when 'MySQL'
        self.connection.execute "ALTER TABLE #{self.table_name} AUTO_INCREMENT=#{to}"
      when 'PostgreSQL'
        self.connection.execute "ALTER SEQUENCE #{self.table_name}_id_seq RESTART WITH #{to};"
      when 'SQLite'
        if self.connection.execute("SELECT name,seq FROM sqlite_sequence WHERE name = '#{self.table_name}'").empty?
          self.connection.execute "INSERT INTO sqlite_sequence(name,seq) VALUES('#{self.table_name}', #{to})"
        else
          self.connection.execute "UPDATE sqlite_sequence SET seq=#{to} WHERE name='#{self.table_name}';"
        end
      else
    end
  end
end
