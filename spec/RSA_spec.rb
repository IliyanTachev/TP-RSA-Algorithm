require_relative '../lib/RSA.rb'

RSpec.describe RSA do
	
	first_message = "Welcome To the Hell!"
	second_message = "EMINEM - Every Mom Is Nice Except Mine"

	rsa = RSA.new(33,3,7)
	values = rsa.new_key
	
	random_values = RSA.new(values[0],values[1],values[2])

	it "checks if n is right" do
		expect(rsa.n).to eq(33)
	end
	
	it "checks if e is right" do
                expect(rsa.e).to eq(3)
        end
	
	it "checks if d is right" do
                expect(rsa.d).to eq(7)
        end

	it "check if encrypt && decrypt work right" do
		expect(rand_values.decrypt rand_values.encrypt first_message).to eq "Welcome To the Hell!"
	end
	
	 it "check if encrypt && decrypt work right" do
                expect(rand_values.decrypt rand_values.encrypt second_message).to eq "EMINEM - Every Mom Is Nice Except Mine"
        end
	
	it "checks if decrypt && encrypt work eith random values" do
		expect(random_values.decrypt random_values.encrypt "Welcome To the Hell!").to eq "Welcome To the Hell!"
	end
	
	
end
