use strict;
use warnings;
use Encode qw(decode encode); #ASCII UTF8
use Clone qw(clone); #cpan Clone
use utf8;
use Config;
binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";

my $z = zeros();
print $z, "\n";
$z = zeros(2);
print $z;
$z = zeros(2, 3);
print $z;
$z = zeros(2, 3, 4);
print $z;

sub zeros{
    
    my @aux_arr = !@_ || $_[-1] =~ /^\d+$/ ? () : @{pop @_};
    my $dim = pop @_;
    return 0 if !defined $dim && !@aux_arr;
    
    if (!@aux_arr) {
        zeros(@_, [map {0} (1 .. $dim)]);
    }else{
        return @aux_arr if !defined $dim;
        if (!@_) {
            return map {clone(\@aux_arr)} (1 .. $dim)
        }else{
            zeros(@, [map {clone(\@aux_arr)} (1 .. $dim)]);
        }        
    }        
}