
BEGIN {
}

{
  max=0
  split($0,row,"")
  l=length(row)
  for(i=1;i<=l;i++) {
    for(j=i+1;j<=l;j++){
      val=int(row[i]""row[j])
      if (val>max) {
        max=val
      }
    }
  }
  sum+=max
}

END {
    print sum
}