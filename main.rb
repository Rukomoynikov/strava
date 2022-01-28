class Thing 
  def do
    p "Hey from instance"
  end

  def self.do_from_class
    p "Hey from class"
  end

  protected def protected_do
    p "Hey from instance"
  end

  protected def self.protected_do_from_class
    p "Hey from class"
  end

  private def private_do
    p "Hey from instance"
  end

  private def self.private_do_from_class
    p "Hey from class"
  end  
end

p Thing.ancestors

Thing.methods
  .grep(/methods/)
  .each do |method_name| 
    p "#{method_name} - #{self.send(method_name).size}"
  rescue
    p "No method like #{method_name}"
  end


# ruby main.rb
# "No method like public_instance_methods"
# "No method like instance_methods"
# "No method like protected_instance_methods"
# "No method like private_instance_methods"
# "methods - 58"
# "singleton_methods - 2"
# "protected_methods - 0"
# "private_methods - 79"
# "public_methods - 58"

# irb(main):002:0> require "./main.rb"
# "No method like public_instance_methods"
# "No method like instance_methods"                                          
# "No method like protected_instance_methods"                                
# "No method like private_instance_methods"                                  
# "methods - 127"                                                            
# "singleton_methods - 66"                                                   
# "protected_methods - 0"
# "private_methods - 81"
# "public_methods - 127"

# irb(main):002:0> Thing.ancestors
# => [Thing, Object, PP::ObjectMixin, Kernel, BasicObject]

# root@168bb05d77cd:/app# ruby main.rb 
# [Thing, Object, Kernel, BasicObject]  
