require_relative 'src/mail_wrapper'
require_relative 'src/recipe_mail_finder'
require_relative 'src/parser'
require_relative 'src/exporter'

desc "Download emails with MenuPlanner recipes and export as FoodPlanner file"
task :default, [:output_path] do |t, args|
  gmail = MailWrapper.new
  finder = RecipeMailFinder.new(gmail)
  exporter = Exporter.new
  finder.attachments.each do |recipe|
    recipe = Parser.new(recipe.to_s).recipe
    puts "Importing #{recipe.name}"
    exporter.add(recipe)
  end

  unless output_path = args[:output_path]
    output_path = 'foodplanner.backup.txt'
  end

  File.open(output_path, 'w') do |f|
    f.write exporter.to_json
  end
end
