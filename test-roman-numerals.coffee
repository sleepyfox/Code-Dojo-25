should = require('chai').should()

describe 'Roman numerals', ->    

  roman = (numeral) -> 
    upperCaseNumeral = numeral.toUpperCase() 
    digits = numeral.split('')
    if upperCaseNumeral is 'V'
      5
    else
      if upperCaseNumeral is 'IV'
        4
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
    'v': 5,
    'IV': 4
  }

  doTest = (expected, actual) ->
    it "should turn #{expected} into #{actual}", ->
      roman(expected).should.equal actual

  for key of tests 
    doTest(key, tests[key])

    