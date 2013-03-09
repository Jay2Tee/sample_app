FactoryGirl.define do
	factory :user do
		name 	"Jamie Thomson"
		email	"jamie@red-tie.com"
		password "foobar"
		password_confirmation "foobar"
	end
end