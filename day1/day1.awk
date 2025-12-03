BEGIN {
 safe=50
 answer1a=0
 answer1b=0
}

{
  delta = substr($0,2)
  # Count multiple 0-passes within a step
  answer1b += int(delta/100)
  delta = delta % 100
}

/L/ {
  safe -= delta
}

/R/ {
  safe += delta
}

{
    # edge case 0-pass for delta<100 which cant start from 0
    if (delta + safe != 0 && safe < 0 || safe > 100) {
        answer1b++
    }
    safe = safe % 100
    if (safe < 0) {
        safe += 100
    } else if (safe == 0) {
        answer1a++
        answer1b++
    }
    print $0,safe,answer1b
}

END {
    print answer1a
    print answer1b
}