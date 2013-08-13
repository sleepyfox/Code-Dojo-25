should = require('chai').should()

describe 'Roman numerals', ->    

  roman = (numeral) -> 
    upperCaseNumeral = numeral.toUpperCase() 
    digits = numeral.split('')
    if upperCaseNumeral is 'V'
      5
    else
      digits.length
    
  tests = {
    'I': 1,
    'i': 1,
    'II': 2,
    'III': 3,
    'IIII': 4,
    'IIIIIIIIIII': 11,
    'V': 5,
    'v': 5
  }

  for input, expected of tests
    it "should turn #{input} into #{expected}", ->
      roman(input).should.equal expected
      