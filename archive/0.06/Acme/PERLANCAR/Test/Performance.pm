package Acme::PERLANCAR::Test::Performance;

our $DATE = '2016-03-16'; # DATE
our $DIST = 'Acme-PERLANCAR-Test-Performance'; # DIST
our $VERSION = '0.06'; # VERSION

use 5.010001;
use integer;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(primes);

my @primes;

sub _is_prime {
    my $num = shift;
    my $sqrt = $num**0.5;
    for my $i (0..$#primes) {
        my $fact = $primes[$i];
        last if $fact > $sqrt;
        return 0 if $num % $fact == 0;
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

__END__

=pod

=encoding UTF-8

=head1 NAME

Acme::PERLANCAR::Test::Performance - Test performance improvement between releases

=head1 VERSION

This document describes version 0.06 of Acme::PERLANCAR::Test::Performance (from Perl distribution Acme-PERLANCAR-Test-Performance), released on 2016-03-16.

=head1 DESCRIPTION

This distribution is created for testing Bencher 0.39 (support for benchmarking
multiple module versions).

In version 0.01 of this module, primes() is slower. Then in 0.02 and later,
performance is increased.

=head1 FUNCTIONS

=head2 primes($n) => list

Return C<$n> prime numbers, in order.

=head1 HOMEPAGE

Please visit the project's homepage at L<https://metacpan.org/release/Acme-PERLANCAR-Test-Performance>.

=head1 SOURCE

Source repository is at L<https://github.com/perlancar/perl-Acme-PERLANCAR-Test-Performance>.

=head1 BUGS

Please report any bugs or feature requests on the bugtracker website L<https://rt.cpan.org/Public/Dist/Display.html?Name=Acme-PERLANCAR-Test-Performance>

When submitting a bug or request, please include a test-file or a
patch to an existing test-file that illustrates the bug or desired
feature.

=head1 AUTHOR

perlancar <perlancar@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2016 by perlancar@cpan.org.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut