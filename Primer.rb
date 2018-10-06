def ordenamiento1 arr
  tem1 = Array.new
  tem2 = Array.new
  if arr.size == 1
    return arr
  elsif (arr.size%2) == 0
    tem1 = ordenamiento1(arr[0...arr.size/2])
    tem2 = ordenamiento1(arr[arr.size/2..-1])
  elsif (arr.size%2) == 1
    tem1 = ordenamiento1(arr[0..arr.size/2])
    tem2 = ordenamiento1(arr[((arr.size/2)+1)..-1])
  end
  tem3 = Array.new
  while !tem1.empty? and !tem2.empty?
    if (tem1[0][0] <= tem2[0][0]) and (tem1[0][1] >= tem2[0][1])
      tem3 << tem1[0]
      tem1.delete_at 0
    else
      tem3 << tem2[0]
      tem2.delete_at 0
    end
  end
  if tem1.empty? and !tem2.empty?
    tem2.each do |x|
      tem3 << x
    end
    
  elsif !tem1.empty? and tem2.empty?
    tem1.each do |x|
      tem3 << x
    end
    
  end
  return tem3
end


argumetos = ARGV
i=0
entrada = Array.new
file = File.open(argumetos[0],'r')
file.each_line do |l|
  i = i + 1
  peso,ci = l.chomp.split
  entrada << [peso.to_i,ci.to_i,i]
  
end

result = ordenamiento1(entrada)
result.each do |x|
  puts x[2]
end
