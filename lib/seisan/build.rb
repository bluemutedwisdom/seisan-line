### build.rb
### builds a VM using veewee

module Seisan
  def build(name,options,veewee_path)
    puts "Initiating the build of #{name}..."
    puts "Options selected are: "
    puts "\t headless => #{options[:headless]};"
    puts "\t force => #{options[:force]}."
    puts "\t bootstrap => #{options[:bootstrap]}."
    puts "\t vsphere => #{options[:vsphere]}."
    puts "\t templatize => #{options[:templatize]}."
    print("Passing the work to veewee...\n\n")

    command = nil
    if options[:vbox]
      command = veewee_command_vbox
    else
      command = veewee_command + 'build '
    end
    
    if options[:headless]
      command = command + '-n '
    end
    if options[:force]
      command = command + '-f '
    end
    if system(command + name)
      puts "#{name} successfully created."
    end

  end 

  def veewee_command_vbox
    return 'veewee vbox'
  end
end
