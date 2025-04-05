require 'spec_helper'
require_relative '../lib/caesar_cipher'

RSpec.describe 'Caesar Cipher' do
  describe 'cipher the text' do
    
    context 'when the given key number is 5' do
      it 'returns the ciphered for \'What a string!\'' do
        expected_output = 'Bmfy f xywnsl!'
        expect(cipher('What a string!', 5)).to eq(expected_output)
      end

      it 'returns the ciphered for \'The winter is coming!\'' do
        expected_output = 'Ymj bnsyjw nx htrnsl!'
        expect(cipher('The winter is coming!', 5)).to eq(expected_output)
      end
    end

  end

  describe 'decipher the text' do
    
    context 'when the given key number is 5' do
      it 'returns the deciphered for \'Bmfy f xywnsl!\'' do
        expected_output = 'What a string!'
        expect(decipher('Bmfy f xywnsl!', 5)).to eq(expected_output)
      end

      it 'returns the deciphered for \'Ymj bnsyjw nx htrnsl!\'' do
        expected_output = 'The winter is coming!'
        expect(decipher('Ymj bnsyjw nx htrnsl!', 5)).to eq(expected_output)
      end
    end

  end
end