<a href="https://codeclimate.com/github/andela-gogbara/Enigma"><img src="https://codeclimate.com/github/andela-gogbara/Enigma/badges/gpa.svg" /></a>
<a href="https://codeclimate.com/github/andela-gogbara/Enigma/coverage"><img src="https://codeclimate.com/github/andela-gogbara/Enigma/badges/coverage.svg" /></a>
[![Build Status](https://travis-ci.org/andela-gogbara/Enigma.svg?branch=master)](https://travis-ci.org/andela-gogbara/Enigma)
# Sofien-Enigma

Sofien-Enigma is an encryption engine built (as a gem) with ruby programming language. It follows the principles of Enigma Encryption Machine to encrypt and decrypt files. The gem also offers the feature of cracking a file.

## Installation

To install as a gem and run as a terminal/command line program, run the following command in you terminal(command prompt for Windows)

    $ gem install sofien-enigma

To use the gem in your project, add it to your gem file

    gem 'sofien-enigma'

And then execute:

    $ bundle

## Usage

This gem provides you with three command line actions, encrypt, decrypt, and crack.
When you have installed the gem, you can encrypt a file by changing to the directory that contains the file, and run any of the following commands


### Encryption

    $ encrypt <plain filename> <encrypted filename>


### Decryption

    $ decrypt <encrypted-filename> [<plain-filename>] <key> <date>

### Cracking

    $ crack <encrypted-filename> [<plain-filename>] <date>


##Example Usage

    $ encrypt message.txt encrypted.txt

    =>#Created encrypted.txt with the key 51569 and date 030316

To decrypt a file named file named encrypted.txt

    $ decrypt encrypted.txt decrypted.txt 51569 030316

    =>#Created decrypted.txt with key 51569 and date 030316

To crack a file named encrypted.txt

    $ crack encrypted.txt crack.txt 030316

    =>#Created cracked.txt with key 51569 and date 030316



## Limitations

* The character set of this gem is limited; lower case alphabets, numbers, space, comma and period characters.
* The gem generates the the key for the encryption, and does not allow user to choose their prefered digit combinations.
* The gem does not have a keys manager to help users save their keys

## Improvement

* The character set supported by the gem will be increased
* The application should able to allow users choose their encryption key upon encrypting a file.
* The gem should be able to offer users the option of creating a text file, when they enter an invalid file name.
* The error handling will be increased to show proper error message for any error that can occur.
* Provide a key management system to store keys for easy reference.
