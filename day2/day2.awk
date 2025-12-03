BEGIN {
    FS = ","
    #Build arrays of all possible numbers with repeated substrings 
    for (i=1;i<100000;i++) {
        s=i
        for(k=1;k<=10;k++) {
            s=s""i
            if(length(s)>10) {
                continue
            }
            # Part 2a: invalid numbers are single repeats
            if(k==1) {
                repeatsa[s]=1
            }
            # Part 2b: invalid numbers are n-repeats
            repeatsb[s]=1
        }
    }
}

{
    split($0,arr,",")
    for (r in arr) {
        split(arr[r],arr2,"-")
        min = arr2[1]
        max = arr2[2]
        for (j=min;j<=max;j++) {
            if (j in repeatsa) {
                suma += j
            }
            if (j in repeatsb) {
                sumb += j
            }
        }
    }
}

END {
    print suma
    print sumb
}