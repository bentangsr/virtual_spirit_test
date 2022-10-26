from_path = ARGV[0]
directories = Dir.glob("#{from_path}/*.txt")

if directories.empty?
  puts "No files in directory and please provide only file with content type .txt"
else
  all_contents = []
  duplicate_contents = []
  directories.each do |directory|
    all_contents.push(File.read(directory).split)
  end

  all_contents.flatten.map do |content|
    if all_contents.flatten.count(content) > 1
      duplicate_contents.push([content, all_contents.flatten.count(content)])
    end
  end
  puts duplicate_contents.uniq
end
