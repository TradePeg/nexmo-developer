require 'rails_helper'

RSpec.describe UserPersonalizationFilter do
    it 'returns input if there is no "current_user" option defined' do 
        input = <<~HEREDOC
        no options defined here
        HEREDOC

        expected_output = <<~HEREDOC
        no options defined here
        HEREDOC

        expect(described_class.call(input)).to eql(expected_output)
    end

    it 'returns input if "options[:current_user].api_key" is blank' do 
        input = <<~HEREDOC
        NEXMO_API_KEY = 
        NEXMO_API_SECRET = 
        HEREDOC

        puts described_class.call(input)
    end
end