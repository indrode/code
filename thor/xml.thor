# thor help xml:inspect
# thor xml:inspect some.xml
require "nokogiri"

class Xml < Thor  
  no_tasks do
    def get_children(parent, depth)
      children_count = 0
      parent.element_children.each do |child|
        incr = "-" * depth
        path = child.path.gsub(/\[.*\]/, "")
        unless @arr.include?(path)
          puts "#{incr} #{child.name} #{path}" if @verbose
          puts "#{incr} #{child.name}" unless @verbose
        end
        children_count += child.children.count
        @arr << path
        get_children(child, depth+1) if children_count > 0
      end
    end
  end
  
  desc "inspect FILE", "Displays structure of an XML document"
  method_option :verbose, :type => :boolean, :aliases => "-v", :desc => "displays element paths"
  def inspect(file)
    time_zero = Time.now
    @verbose ||= options[:verbose]
    @arr = []
    
    input = Nokogiri::XML(File.read(file))
    input.xpath('/').each do |root|
      get_children(root, 0)
    end
    
    duration = Time.now - time_zero
    puts "\nFinished in #{duration} seconds.\n\n"
  end
end