use strict;
use warnings;
use Encode qw(decode encode); #ASCII UTF8
use Clone qw(clone); #cpan Clone
use Data::Dump qw(dump);
use utf8;
use Config;
binmode STDOUT, ":utf8";
binmode STDERR, ":utf8";
=pop
my @a_arr = (95, 7, 'fff', "hola", "como estas");
print @a_arr, "\n";
print $a_arr[-1], "\n";
print $_, "\t" for @a_arr;
print "\n";

map {print $_, "\t"} @a_arr;
print "\n";

map {print $_, "\t"} 0 .. $#a_arr;
print "\n";

map {print $_, "\t"; print $a_arr[$_], "\n"} 0 .. $#a_arr;

print sobreTrabajo(20),"\n";

my @arr_letras = 'a'..'z';
my @arr_letras_clasificacion = map {$arr_letras[$_] =~ /[aeiou]/ ? "v" : "c"} 0..$#arr_letras;
print $_ for @arr_letras_clasificacion, "\n";

my @voc_pos = grep {$arr_letras_clasificacion[$_] =~ /v/} 0..$#arr_letras_clasificacion;
print $_ for @voc_pos, "\n";
=cut
my $zero = zeros();
print $zero, "\n";

my @zero2 = zeros(2);
print $_ for @zero2;

my @zero3 = zeros(2, 3);
dump @zero3;

my @zero4 = zeros(2, 3, 4);
dump @zero4;


sub sobreTrabajo{
    my $horas = shift @_;
    my $sobre_bol;
    $horas > 40 ? return 1 : return 0;    
}

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