AfterStep('@pause') do
  print "Press Return to continue ..."
  STDIN.getc
end

After(ENV['AFTER_SLEEP'] ? '' : '@firebug') do |scenario|
  if scenario.respond_to?(:status) && scenario.status == :failed
    STDERR.puts "Step Failed. Press Return to close browser"
    STDIN.getc
  end
end
