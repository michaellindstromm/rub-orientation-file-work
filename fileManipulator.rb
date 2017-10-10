class FileManipulator
    
    def initialize(file1, file2)
        @car_makes = file1
        @car_models = file2
    end
    
    def read_file_car_makes
        content = open(@car_makes)
        content.read.split(' ')
    end
    
    def read_file_car_models
        content = open(@car_models)
        content.read.split(' ')
    end
    
    def create_car_hash
        makes = read_file_car_makes
        models = read_file_car_models
        car_hash = Hash.new
        model_arr = Array.new
        first_letter = Array.new

        makes.each do |m| 
            car_hash[m] = nil
        end 

        make_keys = car_hash.keys


        make_keys.each do |k|
            first_letter.push([k[0], k])
        end
        
        
        models.each_with_index do |mo, index|
            
            if mo == "="
                model_arr.push([models[index - 1], models[index + 1]])
            else
                
            end
        end
        
        model_arr.each do |arr|
            first_letter.each do |f|
                if f[0] == arr[0]
                    car_hash[f[1]] = arr[1]
                else
                    
                end
            end 
        end

        puts car_hash.inspect

    end
    
end

p ["T", "=", "Camry", "N", "=", "Altima", "H", "=", "Accord"]

puts "What is the car make file name?"
makeName = gets.chomp
puts "What is the car models file name?"
modelName = gets.chomp

f = FileManipulator.new(makeName, modelName)
f.create_car_hash
# ma = f.read_file_car_makes
# mo = f.read_file_car_models

# p ma
# p mo

