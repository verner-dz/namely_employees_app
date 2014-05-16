class CredentialsController < ApplicationController

  def provider
    # We get the access keys
    access_key = ENV['AWS_ACCESS_KEY_ID']
    secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']

    encrypted_access_key = encrypt(access_key)
    encrypted_secret_access_key = encrypt(secret_access_key)

    keys = {
      ak: encrypted_access_key,
      sak: encrypted_secret_access_key
    }

    render json: keys
  end


  def encrypt(thing_we_want_to_encrypt)

    # Get the alphabet and then shuffle it
    alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

    # Make an uppercase alphabet set because we also need that too
    uppercase_alphabet = []
    alphabet.each do |letter|
      uppercase_alphabet << letter.upcase
    end

    alphabet.shuffle!
    uppercase_alphabet.shuffle!

    # Get 1..9 and shuffle them too
    numbers = (1..9).to_a.shuffle!

    # Then we go through the access_key variable, and pop off each one, in turn matching it with
    # the shuffled items from the alphabet

    # Break the key into a hash
    key_array = thing_we_want_to_encrypt.split('')
    encrypted_key = []
    verification_key = {}
    decryption_key = {}


    key_array.each do |n|
      key = nil
      # If we haven't already encrypted this character
      if verification_key[n] == nil
        # If n.to_i is 0 then we know it's a letter
        if n.to_i == 0
          # If this is true, then n is uppercase
          if n == n.upcase
            key = uppercase_alphabet.pop
            verification_key[n] = key
            decryption_key[key] = n
            encrypted_key << key
          else
            key = alphabet.pop
            verification_key[n] = key
            decryption_key[key] = n
            encrypted_key << key
          end
        else
          key = numbers.pop
          verification_key[n] = key
          decryption_key[key] = n
          encrypted_key << key
        end

      else
        key = verification_key[n]
        encrypted_key << key
      end
    end

    output = {
      encrypted_key: encrypted_key.join(),
      decryption_key: decryption_key
    }

    return output


  end

end
