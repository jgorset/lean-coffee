intToRoman = (int) ->
  # create 2-dimensional array, each inner array containing 
  # roman numeral representations of 1-9 in each respective 
  # place (ones, tens, hundreds, etc...currently this handles
  # integers from 1-3999, but could be easily extended)
  romanNumerals = [
    [
      ''
      '&#x2160;' # i
      '&#x2161;' # ii
      '&#x2162;' #iii
      '&#x2163;' # 'iv' 
      '&#x2164;'# 'v'
      '&#x2165;'# 'vi'
      '&#x2166;'# 'vii'
      '&#x2167;'# 'viii
      '&#x2168;'# 'ix'
    ]
    [
      '' #''
      '&#x2169;' #'x'
      '&#x2169;&#x2169;' #'xx'
      '&#x2169;&#x2169;&#x2169;' #'xxx'
      '&#x2169;&#x216c;' #'xl'
      '&#x216c;' #'l'
      '&#x216c;&#x2169;' #'lx'
      '&#x216c;&#x2169;&#x2169;' #'lxx'
      '&#x216c;&#x2169;&#x2169;&#x2169;' #'lxxx
      '&#x2169;&#x216d;' #'xc'
    ]
    [
      '' #''
      '&#x216d;' #'c'
      '&#x216d;&#x216d;' #'cc'
      '&#x216d;&#x216d;&#x216d;' #'ccc'
      '&#x216d;&#x216e;' #'cd'
      '&#x216e;' #'d'
      '&#x216e;&#x216d;' #'dc'
      '&#x216e;&#x216d;&#x216d;' #'dcc'
      '&#x216e;&#x216d;&#x216d;&#x216d;' #'dccc'
      '&#x216d;&#x216f;' #'cm'
    ]
    [
      ''  #''
      '&#x216f;' #'m'
      '&#x216f;&#x216f;'  #'mm'
      '&#x216f;&#x216f;&#x216f;' #'mmm'
    ]
  ]
  # split integer string into array and reverse array
  intArr = int.toString().split('').reverse()
  len = intArr.length
  romanNumeral = ''
  i = len
  # starting with the highest place (for 3046, it would be the thousands 
  # place, or 3), get the roman numeral representation for that place 
  # and add it to the final roman numeral string
  while i--
    romanNumeral += romanNumerals[i][intArr[i]]
  romanNumeral

angular.module "lean-coffee"
  .filter 'toRoman', ($sce) ->
    (number) ->
      $sce.trustAsHtml(intToRoman(number))

