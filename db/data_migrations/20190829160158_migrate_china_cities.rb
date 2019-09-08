class MigrateChinaCities < ActiveRecord::DataMigration
  def up
    delete_all_data

    file = 'db/data_migrations/data/china_city.json'
    districts = JSON.parse(File.open(file).read)
    provinces = districts['province']
    cities = districts['city']
    districts = districts['district']

    provinces.each { |province| Province.create!(name: province['text'], area_id: province['id']) }

    province_code = {}
    provinces.each do |province|
      province_code[province['id'][0..1]] = province['text']
    end

    cities_params = {}
    cities.each do |city|
      next if trash_data?(city['text'])
      province = Province.find_by!(name: province_code[city['id'][0..1]])
      city_name = city['text']
      area_id = city['id']
      if ['北京市', '上海市', '重庆市', '天津市'].include?(province.name)
        city_name = province.name
        area_id = province.area_id
      end
      cities_params[city_name] = { name: city_name, area_id: area_id, province: province }
    end

    cities_params.each { |_, create_params| City.create!(create_params) }

    city_code = {}
    cities.each do |city|
      city_code[city['id'][0..3]] = city['text']
    end

    districts.each do |district|
      province = Province.find_by!(name: province_code[district['id'][0..1]])
      city_name = if ['北京市', '上海市', '重庆市', '天津市'].include?(province.name)
                    province.name
                  else
                    city_code[district['id'][0..3]]
                  end
      next if trash_data?(city_name)
      District.create!(name: district['text'], city: City.find_by!(name: city_name), area_id: district['id'])
    end

    puts "Successfully migrated data to table districts, cities and provinces from file '#{file}'."
  end

  def down
    delete_all_data
  end

  def delete_all_data
    District.delete_all
    City.delete_all
    Province.delete_all
    puts 'Deleted all data in table districts, cities and provinces.'
  end

  def trash_data?(data)
    data =~ /地区|省直辖|自治区直辖/
  end
end
