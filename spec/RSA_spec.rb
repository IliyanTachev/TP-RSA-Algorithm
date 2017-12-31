require 'simplecov'
SimpleCov.start
require_relative '../lib/RSA.rb'

RSpec.describe RSA do
	
	first_message = "Welcome To the Hell!"
	second_message = "EMINEM - Every Mom Is Nice Except Mine"
	
	rsa = RSA.new(574571,60719 ,368111 )
	values = rsa.new_key
	
	random_values = RSA.new(values[0],values[1],values[2])

	context "basic tests" do

		it "checks if n is right" do
			expect(rsa.n).to eq(574571)
		end
	
		it "checks if e is right" do
       		        expect(rsa.e).to eq(60719)
	       	end
	
		it "checks if d is right" do
	                expect(rsa.d).to eq(368111)
	        end
	end
	
	 context "advanced tests" do
		
		it "checks if crypt/decrypt works" do
			expect(rsa.decrypt(rsa.encrypt(first_message))).to eq(first_message)
		end

		it "check if encrypt && decrypt work right" do
			expect(random_values.decrypt random_values.encrypt first_message).to eq "Welcome To the Hell!"
		end
	
	 	it "check if encrypt && decrypt work right - longer msg" do
                	expect(random_values.decrypt random_values.encrypt second_message).to eq "EMINEM - Every Mom Is Nice Except Mine"
        	end
	
		it "checks if decrypt && encrypt work with random values" do
			expect(random_values.decrypt random_values.encrypt "Welcome To the Hell!").to eq "Welcome To the Hell!"
		end
	end
	
end
