should = require('chai').should()


replaceNumeralsWithValues = (numeral) ->
  numerals = {
    'I': 1,
    'V': 5,
    'X': 10,
    'L': 50,
    'C': 100,
    'D': 500,
    'M': 1000
  }
  numerals[numeral] || 0

describe 'A Roman numeral lookup', ->
  it 'should return 0 when given the empty string', ->
    replaceNumeralsWithValues("").should.equal 0
  it 'should replace "I" with 1', ->
    replaceNumeralsWithValues('I').should.equal 1
  it 'should replace "V" with 5', ->
    replaceNumeralsWithValues('V').should.equal 5
  it 'should replace "X" with 10', ->
    replaceNumeralsWithValues('X').should.equal 10
  it 'should replace "L" with 50', ->
    replaceNumeralsWithValues('L').should.equal 50
  it 'should replace "C" with 100', ->
    replaceNumeralsWithValues('C').should.equal 100


twoCharWindow = (array) ->
  if array.length is 0 
    return []
  if array.length is 1
    return array
  array.map((value, index, arr) -> 
    if index is arr.length - 1 
      value
    else
      value + arr[index + 1])  

describe 'A two character window', ->
  it 'should return an empty array when given an empty array', ->
    twoCharWindow([]).should.have.length 0
  it "should return [a] when given [a]", ->
    result = twoCharWindow(["a"])
    result.should.have.length 1
    result[0].should.equal "a"
  it "should return [ab,a] when given [a,b]", ->
    result = twoCharWindow(['a', 'b'])
    result.should.have.length 2
    result[0].should.equal "ab"
    result[1].should.equal "b"
  it "should return [ab,bc,c] when given [a,b,c]", ->
    result = twoCharWindow(['a', 'b', 'c'])
    result.should.have.length 3
    result[0].should.equal "ab"
    result[1].should.equal "bc"
    result[2].should.equal "c"


replaceDoubleNumeralsWithValues = (key) ->
  doubles = {
    "IV": -2,
    "IX": -2, 
    "XL": -20,
    "XC": -20,
    "CD": -200,
    "CM": -200
  }
  doubles[key] || 0

describe 'replaceDoubleNumeralsWithValues', ->
  it 'should replace X with 0', ->
    replaceDoubleNumeralsWithValues("X").should.equal 0
  it 'should replace IV with -2', ->
    replaceDoubleNumeralsWithValues("IV").should.equal -2
  it 'should replace IX with -2', ->
    replaceDoubleNumeralsWithValues("IX").should.equal -2
  it 'should replace XL with -20', ->
    replaceDoubleNumeralsWithValues("XL").should.equal -20
  it 'should replace XC with -20', ->
    replaceDoubleNumeralsWithValues("XC").should.equal -20
  it 'should replace CD with -200', ->
    replaceDoubleNumeralsWithValues("CD").should.equal -200
  it 'should replace CM with -200', ->
    replaceDoubleNumeralsWithValues("CM").should.equal -200


describe 'Roman numerals', -> 
  roman = (numeral) -> 
    # use map.reduce for single numeral addition
    # use 2 char window map.reduce for subtraction
    upperCaseNumeral = numeral.toUpperCase() 
    singleDigits = upperCaseNumeral.split('')
    doubleDigits = twoCharWindow(singleDigits)
    sum = singleDigits.map(replaceNumeralsWithValues).reduce((previous, current) -> previous + current)
    subtractor = doubleDigits.map(replaceDoubleNumeralsWithValues).reduce((previous, current) -> previous + current)
    sum = sum + subtractor

  tests = {
    'I': 1,
    'i': 1,
    'II': 2,
    'III': 3,
    'IIII': 4,
    'IIIIIIIIIII': 11,
    'V': 5,
    'v': 5,
    'IV': 4,
    'L': 50,
    'C': 100, 
    'D': 500, 
    'M': 1000, 
    'IV': 4,
    'IX': 9,
    'LIX': 59,
    'MCM': 1900
  }

  doTest = (expected, actual) ->
    it "should turn #{expected} into #{actual}", ->
      roman(expected).should.equal actual

  for romanNumeral of tests 
    expectedNumber = tests[romanNumeral]
    doTest(romanNumeral, expectedNumber)
 