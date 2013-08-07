use v6;

say qq{
Problem 29

Consider all integer combinations of a^b for 2 <= a <= 5 and 2 <= b <= 5:

    2^2=4, 2^3=8, 2^4=16, 2^5=32
    3^2=9, 3^3=27, 3^4=81, 3^5=243
    4^2=16, 4^3=64, 4^4=256, 4^5=1024
    5^2=25, 5^3=125, 5^4=625, 5^5=3125

If they are then placed in numerical order, with any repeats removed, we get the 
following sequence of 15 distinct terms:

4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125

How many distinct terms are in the sequence generated by ab for 
2 <= a <= 100 and 2 <= b <= 100?

};

say euler29();
say euler29b();
say euler29c();


sub euler29 {
  my $m_min = 2;
  my $m_max = 100;

  my %h = ();
  for $m_min..$m_max -> $a {
    for $m_min..$m_max -> $b {
       %h{$a**$b}++;
    }
  }

  return %h.keys.elems;
}


sub euler29b {

  return ({ $^a**$^b } for 2..100 X 2..100).uniq.elems;
}


sub euler29c {
  my $m_min = 2;
  my $m_max = 100;

  my %h = ();
  my $u = 0;
  for $m_min..$m_max -> $a {
    for $m_min..$m_max -> $b {
       $u++ if !%h{$a**$b}++;
    }
  }

  return $u;
}
