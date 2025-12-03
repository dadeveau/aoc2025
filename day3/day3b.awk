{
    split($0,row,"")
    l=length(row)
    sumA+=recurse(row,2,1,1,l,"")
    sumB+=recurse(row,12,1,1,l,"")
}

END {
    print "3a: "sumA
    print "3b: "sumB
}

function recurse(row,numBatteries,startIndex,digNum,rowLen,joltageSoFar) {
  if(digNum > numBatteries) {
    return joltageSoFar
  }
  maxValInRange=0
  for(j=startIndex;j<=rowLen-numBatteries+digNum;j++) {
    if(row[j]>maxValInRange) {
        maxValInRange=row[j]
    }
  }
  for(j=startIndex;j<=rowLen-numBatteries+digNum;j++) {
    if(row[j]==maxValInRange) {
        return recurse(row,numBatteries,j+1,digNum+1,rowLen,joltageSoFar""row[j])
    }
  }
}