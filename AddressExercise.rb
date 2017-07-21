def PrintAndReturnHashValues(hash)
	str = ""
	
	# Checks if passed in variable is a hash
	if hash.is_a?(Hash)
		# Checks if "subpremise" and "house_name" are not nil. If true join them together
		if hash.fetch("subpremise") != nil
			if hash.fetch("house_name") != nil
				str = hash.values_at("subpremise", "house_name").join(", ")
			end
		elsif hash.fetch("house_name") != nil
			str = hash.fetch("house_name")
		else
		end
		
		# Checks if "house_number" is not nil 
		# If this is true join together with "street_line_1"
		if hash.fetch("house_number") != nil
			# Checks if 'str' is empty. 
			# This is in case both "subpremise" and "house_name" are nil as they are not both mandatory.
			if str.empty?
				str1 = hash.values_at("house_number", "street_line_1").join(" ")
				# Appends string 'str1' to string 'str'. (Same below)
				str << "#{str1},"
			else
				str1 = hash.values_at("house_number", "street_line_1").join(" ")
				str << "\n#{str1},"
			end
		else
			if str.empty?
				str1 = hash.fetch("street_line_1")
				str << "#{str1},"
			else
				str1 = hash.fetch("street_line_1")
				str << "\n#{str1},"
			end
		end
		
		if hash.fetch("street_line_2") != nil
			str2 = hash.fetch("street_line_2")
			str << "\n#{str2},"
		end
		
		if hash.fetch("town_or_city") != nil
			str3 = hash.fetch("town_or_city")
			str << "\n#{str3},"
		end
		
		if hash.fetch("region") != nil
			str4 = hash.fetch("region")
			str << "\n#{str4},"
		end
		
		# Puts post code in upcase
		str << "\n#{hash.fetch("postcode").upcase}"
		
		# Outputs and returns final appended string
		puts str
		return str
	end
end