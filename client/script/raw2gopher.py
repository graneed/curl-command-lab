def result(s): 
  a = [s[i:i+2] for i in xrange(0, len(s), 2)] 
  return "curl --output - gopher://curl.test:3306/_%" + "%".join(a)
if __name__ == "__main__": 
  import sys    
  s = sys.argv[1]  
  print result(s)
