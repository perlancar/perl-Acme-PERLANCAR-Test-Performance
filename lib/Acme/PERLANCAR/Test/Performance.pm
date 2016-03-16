package Acme::PERLANCAR::Test::Performance;

# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(primes);

my @primes;

sub _is_prime {
    my $num = shift;
    for (2..$num**0.5) {
        return 0 if $num % $_ == 0;
    }
    1;
}

sub primes {
    my $n = shift;

    my @res;
    for my $i (1..$n) {
        if (@primes >= $i) {
            push @res, $primes[$i-1];
        } else {
            my $num = @primes ? $primes[-1]+1 : 2;
            while (1) {
                if (_is_prime($num)) {
                    push @primes, $num;
                    push @res, $num;
                    last;
                }
                $num++;
                $num++ if $num % 2 == 0; # quick skip even numbers
            }
        }
    }
    @res;
}

1;
# ABSTRACT: Test performance improvement between releases

=head1 DESCRIPTION

This distribution is created for testing Bencher 0.39 (support for benchmarking
multiple module versions).

In version 0.01 of this module, primes() is slower. Then in 0.02 and later,
performance is increased.


=head1 FUNCTIONS

=head2 primes($n) => list

Return C<$n> prime numbers, in order.
